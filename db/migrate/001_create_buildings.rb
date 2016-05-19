class CreateBuildings < ActiveRecord::Migration
  def self.up
    create_table :buildings do |t|
      t.string :code
      t.string :name
      t.string :address
      t.string :contact_email
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :buildings
  end
end
