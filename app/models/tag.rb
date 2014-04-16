class Tag < ActiveRecord::Base
  has_many :moments
  has_many :photos, through: :moments
  # Remember to create a migration!
end
