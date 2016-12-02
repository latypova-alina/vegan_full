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

ActiveRecord::Schema.define(version: 20161202104314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "baskets", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "baskets", ["user_id"], name: "index_baskets_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "food_recipes", force: :cascade do |t|
    t.integer  "food_id"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "food_recipes", ["food_id"], name: "index_food_recipes_on_food_id", using: :btree
  add_index "food_recipes", ["recipe_id"], name: "index_food_recipes_on_recipe_id", using: :btree

  create_table "foods", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.integer  "category_id"
  end

  add_index "foods", ["category_id"], name: "index_foods_on_category_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "content"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",               default: "",     null: false
    t.string   "encrypted_password",  default: "",     null: false
    t.integer  "sign_in_count",       default: 0,      null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.datetime "last_sign_in_at"
    t.datetime "current_sign_in_at"
    t.datetime "remember_created_at"
    t.string   "last_sign_in_ip"
    t.string   "current_sign_in_ip"
    t.string   "role",                default: "user"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
