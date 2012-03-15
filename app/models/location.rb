class Location < ActiveRecord::Base

  # associations
  has_many :excuses, :class_name => "Excuse", :foreign_key => "location_id"

  # validations
  validates_length_of :name, :within => 2..50, :on => :create, :message => "is too short or too long..."

  # callbacks

  # methods
  # def self.search(total)
  #   self.
  # end
end
