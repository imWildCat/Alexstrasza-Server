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

ActiveRecord::Schema.define(version: 20150716045318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "unique_words", force: :cascade do |t|
    t.string "word", limit: 255, null: false
  end

  add_index "unique_words", ["word"], name: "index_unique_words_on_word", unique: true, using: :btree

  create_table "user_tokens", primary_key: "token", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "device",     null: false
    t.datetime "expires_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_tokens", ["user_id"], name: "index_user_tokens_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "nickname",        limit: 15,              null: false
    t.string   "email",           limit: 255
    t.string   "phone",           limit: 63
    t.string   "password_digest"
    t.integer  "failed_attempts",             default: 0, null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["nickname"], name: "index_users_on_nickname", unique: true, using: :btree
  add_index "users", ["phone"], name: "index_users_on_phone", unique: true, using: :btree

  create_table "wiki_definitions", force: :cascade do |t|
    t.integer "wiki_unique_word_id", null: false
    t.integer "word_type",           null: false
    t.string  "meaning",             null: false
    t.string  "example"
  end

  add_index "wiki_definitions", ["wiki_unique_word_id"], name: "index_wiki_definitions_on_wiki_unique_word_id", using: :btree

  create_table "wiki_unique_words", force: :cascade do |t|
    t.string "word", limit: 255, null: false
  end

  add_index "wiki_unique_words", ["word"], name: "index_wiki_unique_words_on_word", unique: true, using: :btree

  create_table "word_definitions", force: :cascade do |t|
    t.integer "unique_word_id", null: false
    t.integer "word_type",      null: false
    t.string  "meaning",        null: false
    t.string  "example"
  end

  add_index "word_definitions", ["unique_word_id"], name: "index_word_definitions_on_unique_word_id", using: :btree

end
