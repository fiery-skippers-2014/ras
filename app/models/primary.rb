class Primary < ActiveRecord::Base
  validates :title, uniqueness: true
end
