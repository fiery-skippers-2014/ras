class Photo < ActiveRecord::Base
  has_many :moments
  has_many :tags, through: :moments

  validates :url, uniqueness: true
  # Remember to create a migration!
end
