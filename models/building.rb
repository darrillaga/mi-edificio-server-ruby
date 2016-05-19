class Building < ActiveRecord::Base

  has_many :building_users
  has_many :posts
end
