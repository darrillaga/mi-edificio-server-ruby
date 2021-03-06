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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 4) do

  create_table "building_users", force: :cascade do |t|
    t.string   "name"
    t.string   "apartment"
    t.string   "role_description"
    t.boolean  "building_creator"
    t.integer  "building_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "buildings", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "address"
    t.string   "contact_email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "text"
    t.integer  "building_id"
    t.integer  "building_user_id"
    t.integer  "post_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "text"
    t.integer  "building_id"
    t.integer  "building_user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
