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

ActiveRecord::Schema.define(:version => 20130622183853) do

  create_table "bills", :force => true do |t|
    t.string   "bill_id"
    t.string   "bill_type"
    t.integer  "number"
    t.string   "congress"
    t.string   "short_title"
    t.string   "nicknames"
    t.datetime "introduced_on"
    t.datetime "last_action_at"
    t.datetime "last_vote_at"
    t.text     "official_title"
    t.string   "popular_title"
    t.string   "congress_url"
    t.string   "govtrack_url"
    t.string   "opencongress_url"
    t.boolean  "active"
    t.datetime "active_at"
    t.boolean  "awaiting_signature"
    t.boolean  "enacted"
    t.datetime "enacted_at"
    t.string   "house_passage_result"
    t.datetime "house_passage_result_at"
    t.string   "senate_passage_result"
    t.datetime "senate_passage_result_at"
    t.boolean  "vetoed"
  end

  create_table "updates", :force => true do |t|
    t.string   "details"
    t.datetime "datetime"
    t.integer  "bill_id"
  end

end
