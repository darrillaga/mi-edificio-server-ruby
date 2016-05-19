class Post < ActiveRecord::Base

  belongs_to :building_user
  belongs_to :building

  has_many :comments
end
