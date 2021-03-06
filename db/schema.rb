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

ActiveRecord::Schema.define(version: 20170308122011) do

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.boolean  "confirmed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "language"
  end

  create_table "languages_users", id: false, force: :cascade do |t|
    t.integer "user_id",     null: false
    t.integer "language_id", null: false
    t.string  "action"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "receiver_id"
    t.text     "text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "text"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string  "gender"
    t.date    "birth_date"
    t.text    "about_me"
    t.integer "user_id"
    t.string  "avatar"
    t.string  "from_country"
    t.string  "last_location"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users_learn_languages", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "language_id"
    t.index ["language_id"], name: "index_users_learn_languages_on_language_id"
    t.index ["user_id", "language_id"], name: "users_learn_languages_index", unique: true
    t.index ["user_id"], name: "index_users_learn_languages_on_user_id"
  end

  create_table "visited_countries", force: :cascade do |t|
    t.integer "user_id"
    t.string  "country"
  end

end
