class Tag < ActiveRecord::Base

  # associations
  has_many :taggings, :dependent => :destroy
  has_many :excuses, :through => :taggings

end
