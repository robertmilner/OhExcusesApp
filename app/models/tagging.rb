class Tagging < ActiveRecord::Base

  # associations
  belongs_to :excuse
  belongs_to :tag

end
