# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130926085928) do

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.integer  "city_id"
    t.integer  "news_item_id"
    t.decimal  "lat",          :precision => 10, :scale => 6
    t.decimal  "lng",          :precision => 10, :scale => 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["city_id", "news_item_id"], :name => "index_locations_on_city_id_and_news_item_id", :unique => true
  add_index "locations", ["city_id"], :name => "index_locations_on_city_id"
  add_index "locations", ["news_item_id"], :name => "index_locations_on_news_item_id"

  create_table "news_items", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "date"
    t.integer  "item_type"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "news_items", ["date"], :name => "index_news_items_on_date"
  add_index "news_items", ["item_type"], :name => "index_news_items_on_item_type"

end
