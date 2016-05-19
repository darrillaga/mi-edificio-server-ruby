class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :text
      t.belongs_to :building
      t.belongs_to :building_user
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :posts
  end
end
