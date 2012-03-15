class Excuse < ActiveRecord::Base

  # associations
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :location, :class_name => "Location", :foreign_key => "location_id"

  # validations
  validates_presence_of :text
  validates_length_of :text, :within => 3..255

  # callbacks


  # methods
  def self.random(total)
    self.find(:all, order: 'random()', limit: total)
  end

end
