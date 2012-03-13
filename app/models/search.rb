class Search < ActiveRecord::Base

  # associations
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"

  # validations
  validates_presence_of :query
  validates_length_of :query, :within => 1..255

  # callbacks

  # methods

end
