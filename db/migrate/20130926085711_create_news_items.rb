class CreateNewsItems < ActiveRecord::Migration
  def self.up
    create_table :news_items do |t|
      t.string :title
      t.text :content
      t.datetime :date
      t.integer :item_type
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :news_items, :item_type
    add_index :news_items, :date
  end

  def self.down
    drop_table :news_items
  end
end
