class Excuse < ActiveRecord::Base

  # associations
  belongs_to :user
  belongs_to :location
  has_many :favorites, :as => :favorable

  # validations
  validates_presence_of :text
  validates_length_of :text, :within => 3..255

  # callbacks


  # methods
  # pages_contoller#excuse
  def self.random(total)
    self.find(:all, :order => 'random()', :limit => total)
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

  # pages_contoller#location
  def self.location(search, total)
    if search
      all(  :joins => { :location => { } }, 
            :conditions => { :locations => { :name => search } },
            # { :locations => { :name => "%#{search}%" } },
            # A.find(:all, :conditions => ["b.foo = ?", 25], :joins => {:b =>{}} )
            
            # :conditions => { :locations => [(['name LIKE ?'] * search_length).join(' AND ')] + search.split.map { |name| "%#{name}%" },
            # :conditions => { :locations => { :name => search } },
            :limit => total,
            :order => 'random()' )
    else
      find(:all, :limit => total, :order => 'random()')
    end
  end

end
