class Search < ActiveRecord::Base

  # associations
  belongs_to :user

  # validations
  validates_presence_of :query
  validates_length_of :query, :within => 1..255

  # callbacks

  # methods

end
