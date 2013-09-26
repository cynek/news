class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.references :city
      t.references :news_item
      t.decimal :lat, :precision => 10, :scale => 6
      t.decimal :lng, :precision => 10, :scale => 6

      t.timestamps
    end

    add_index :locations, :city_id
    add_index :locations, :news_item_id
    add_index :locations, [:city_id, :news_item_id], :unique => true
  end

  def self.down
    drop_table :locations
  end
end
