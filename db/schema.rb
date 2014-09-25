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

ActiveRecord::Schema.define(version: 20140919234732) do

  create_table "movie_votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "movie_id"
    t.boolean  "like"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movie_votes", ["movie_id"], name: "fk_movie_votesB", using: :btree
  add_index "movie_votes", ["user_id", "movie_id"], name: "index_movie_votes_on_user_id_and_movie_id", unique: true, using: :btree

  create_table "movies", force: true do |t|
    t.integer  "user_id"
    t.string   "title",       limit: 40, null: false
    t.text     "description",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movies", ["user_id"], name: "index_movies_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name",      limit: 25, null: false
    t.string   "last_name",       limit: 50, null: false
    t.string   "email",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
