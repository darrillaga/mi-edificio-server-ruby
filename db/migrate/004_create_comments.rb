class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :text
      t.belongs_to :building
      t.belongs_to :building_user
      t.belongs_to :post
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :comments
  end
end
