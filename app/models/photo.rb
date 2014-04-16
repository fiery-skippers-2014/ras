class Photo < ActiveRecord::Base
  has_many :moments
  has_many :tags, through: :moments
  # Remember to create a migration!
end
