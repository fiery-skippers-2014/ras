class Moment < ActiveRecord::Base
  belongs_to :tag
  belongs_to :photo
  # Remember to create a migration!
end
