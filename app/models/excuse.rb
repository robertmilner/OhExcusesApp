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

  # class methods
    # pages_controller [:excuse, :search, :location, :tag]
    def self.find_excuses_by_random(total)
      limit(total).order('random()')
    end

    # pages_controller [:search] by params[:text]
    def self.find_excuses_by_named_text(name, total)
      where('text LIKE ?', "%#{name}%").limit(total)
    end

    def self.search_excuses(search, total)
      if search
        search_length = search.split.length
        # keyword type search with words in specific order
        # find(:all, :conditions => ['text LIKE ?', "%#{search}%"], :limit => total, :order => 'random()')
      
        # completely fuzzy search, no word order necessary 
        find( :all, 
              :conditions => [(['text LIKE ?'] * search_length).join(' AND ')] + search.split.map { |name| "%#{name}%" }, 
              :limit => total, 
              :order => 'random()' )
      end
    end

    # pages_contoller#location
    def self.search_locations(search, total)
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

    def self.search_tags(search, total)
      if search
        search_terms = search.split
        search_terms.each do |term|
          @taggings = Tag.where('name LIKE ?', "%#{term}%")
        end
        @taggings.each do |tag|
          @tagged_excuses = Excuse.where('text LIKE ?', "%#{tag}%")
        end
        return @tagged_excuses
      else
        find(:all, :limit => total, :order => 'random()')
      end
    end

  # instance methods
    def tag_names
      @tag_names || tags.map(&:name).join(' ')
    end

    def assign_tags
      if @tag_names
        self.tags = @tag_names.split(',').map do |name|
          name = name.strip
          Tag.find_or_create_by_name(name)
        end
      end
    end

end
