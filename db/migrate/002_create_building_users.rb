class CreateBuildingUsers < ActiveRecord::Migration
  def self.up
    create_table :building_users do |t|
      t.string :name
      t.string :apartment
      t.string :role_description
      t.boolean :building_creator
      t.belongs_to :building
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :building_users
  end
end
