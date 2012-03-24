class Tag < ActiveRecord::Base

  # associations
  has_many :taggings, :dependent => :destroy
  has_many :excuses, :through => :taggings

  # class methods
  def self.find_excuses_by_named_tag(name, total)
    tag = where('name LIKE ?', "%#{name}%")
    if tag.empty?
      []
    else
      tag.first.excuses.order('random()').limit(total)
    end
  end

  def self.find_excuses_by_searched_tags(search, total)
    if search
      search_length = search.split.length
      tags = find(:all,
                  :conditions => [(['name LIKE ?'] * search_length).join(' OR ')] + search.split.map { |name| "%#{name}%" }, 
                  :limit => total)
      excuses = tags.flat_map { |i| i.excuses.limit(total) }
      return excuses.shuffle
    else
      []
    end
  end

end
