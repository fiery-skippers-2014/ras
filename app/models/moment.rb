class Moment < ActiveRecord::Base
  belongs_to :tag, :photo
  # Remember to create a migration!
end
