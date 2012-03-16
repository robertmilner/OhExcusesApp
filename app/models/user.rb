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

end
