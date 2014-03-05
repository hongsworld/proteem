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

ActiveRecord::Schema.define(:version => 20140211215654) do

  create_table "menus", :force => true do |t|
    t.string   "menu"
    t.string   "price"
    t.string   "img_url"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.integer  "category"
    t.string   "detail_category"
    t.integer  "location"
    t.string   "address"
    t.string   "phone"
    t.string   "feature"
    t.boolean  "delete_flag",     :default => false
    t.string   "img_url"
    t.string   "dummy1"
    t.string   "dummy2"
    t.string   "dummy3"
    t.string   "dummy4"
    t.float    "lng"
    t.float    "lat"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "replies", :force => true do |t|
    t.integer  "post_id"
    t.string   "name"
    t.string   "content"
    t.boolean  "delete_flag"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
