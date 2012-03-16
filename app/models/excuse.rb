class Excuse < ActiveRecord::Base

  # associations
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :location, :class_name => "Location", :foreign_key => "location_id"

  # validations
  validates_presence_of :text
  validates_length_of :text, :within => 3..255

  # callbacks


  # methods
  # pages_contoller#excuses
  def self.random(total)
    self.find(:all, order: 'random()', limit: total)
  end

  def self.search(search, total)
    if search
      search_length = search.split.length
      # keyword type search with words in specific order
      # find(:all, :conditions => ['text LIKE ?', "%#{search}%"], :limit => total, :order => 'random()')
      
      # completely fuzzy search, no word order necessary 
      find( :all, 
            :conditions => [(['text LIKE ?'] * search_length).join(' AND ')] + search.split.map { |name| "%#{name}%" }, 
            :limit => total, 
            :order => 'random()' )
    else
      find(:all, :limit => total, :order => 'random()')
    end
  end

end
