class User < ActiveRecord::Base

  # associations
  belongs_to :location, :class_name => "Location", :foreign_key => "location_id"
  has_many :excuses, :class_name => "Excuse", :foreign_key => "user_id"
  has_many :searches, :class_name => "Search", :foreign_key => "user_id"

  # validations
  has_secure_password

  validates_presence_of :name

  # callbacks

  # methods

end
