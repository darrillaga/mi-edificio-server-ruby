class Comment < ActiveRecord::Base

  belongs_to :building
  belongs_to :building_user
  belongs_to :post
end
