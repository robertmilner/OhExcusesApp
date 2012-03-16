class Location < ActiveRecord::Base

  # associations
  has_many :excuses

  # validations
  validates_length_of :name, :within => 2..50, :on => :create, :message => "is too short or too long..."

  # callbacks

  # methods
  def self.search(search, total)
    if search
      # split the params[:search] query and get length
      search_length = search.split.length
      # completely fuzzy search, no word order necessary 
      find( :all, 
            :conditions => [(['name LIKE ?'] * search_length).join(' AND ')] + search.split.map { |name| "%#{name}%" }, 
            :limit => total, 
            :order => 'random()' )
    else
      find(:all, :limit => total, :order => 'random()')
    end
  end
end
