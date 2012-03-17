class Excuse < ActiveRecord::Base

  # associations
  belongs_to :user
  belongs_to :location
  has_many :favorites, :as => :favorable
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings
  
  # attributes
  attr_writer :tag_names

  # validations
  validates_presence_of :text
  validates_length_of :text, :within => 3..255

  # callbacks
  after_save :assign_tags

  # methods
  
  def tag_names
    @tag_names || tags.map(&:name).join(' ')
  end
  
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
  def self.search_location(search, total)
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

  def self.search_tag(search, total)
    if search
      all(  :joins => { :tags => {} },
            :conditions => { :tags => { :name => search } },
            :limit => total,
            :order => 'random()' )
    end
  end

  # pages_contoller#tag
  def assign_tags
    if @tag_names
      self.tags = @tag_names.split.map do |name|
        Tag.find_or_create_by_name(name)
      end
    end
  end

end
