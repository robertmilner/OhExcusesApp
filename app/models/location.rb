class Location < ActiveRecord::Base

  # associations
  has_many :excuses

  # validations
  validates_length_of :name, :within => 2..50, :on => :create, :message => "is too short or too long..."

  # callbacks

  # class methods
  def self.find_excuses_by_named_location(name, total)
    location = where('name LIKE ?', "%#{name}%")
    if location.empty?
      []
    else
      location.first.excuses.order('random()').limit(total)
    end
  end

  def self.find_excuses_by_searched_locations(search, total)
    if search
      # split the params[:search] query and get length
      search_length = search.split.length
      # completely fuzzy search, no word order necessary 
      locations = find( :all,
                        :conditions => [(['name LIKE ?'] * search_length).join(' OR ')] + search.split.map { |name| "%#{name}%" }, 
                        :limit => total)
      excuses = locations.flat_map { |i| i.excuses.limit(total) }
      return excuses.shuffle
    else
      []
    end
  end

end