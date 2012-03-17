class User < ActiveRecord::Base

  # associations
  belongs_to :location
  has_many :excuses
  has_many :searches
  has_many :favorites

  # validations
  has_secure_password

  validates_presence_of :name

  # callbacks

  # methods
  def favorable(opts={})

    # favorable_type
    type = opts[:type] ? opts[:type] : :excuse
    type = type.to_s.capitalize

    # add favorable_id to condition if id is provided
    # con = ["user_id = ? AND favorable_type = ?", self.id, type]
    con = { :user_id => self.id, :favorable_type => type }
    

    # append favorable id to the query if an :id is passed as an option into the
    # function, and then append that id as a string to the "con" Array
    if opts[:id]
      con[0] += " AND favorable_id = ?"
      con << opts[:id].to_s
    end

    # Return all Favorite objects matching the above conditions
    favs = Favorite.all(:conditions => con)

    case opts[:delve]
    when nil, false, :false
      return favs
    when true, :true
      # get a list of all favorited object ids
      fav_ids = favs.collect{ |f| f.favorable_id.to_s }

      if fav_ids.size > 0
        # turn the Capitalized favorable_type into an actual class Constant
        type_class = type.constantize

        # build a query that only selects the excuses by ids related to user
        # return type_class.find(:all, :conditions => ["id IN (?)", fav_ids ])
        # return type_class.find(:all, :conditions => { :id => fav_ids })
        return type_class.find_all_by_id(fav_ids)
      else
        return []
      end
    end
  end
end
