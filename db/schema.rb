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

ActiveRecord::Schema.define(version: 20170414143152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "type"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_jobs", id: false, force: :cascade do |t|
    t.integer "job_id",      null: false
    t.integer "category_id", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_comments_on_job_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "date"
    t.float    "hourly_rate"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "address_line3"
    t.string   "address_line4"
    t.integer  "chosen_applicant_id"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["user_id"], name: "index_jobs_on_user_id", using: :btree
  end

  create_table "jobs_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "job_id",  null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.text     "body"
    t.string   "subject"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_pictures_on_job_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.string   "profile_picture"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "address_line3"
    t.string   "address_line4"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "comments", "jobs"
  add_foreign_key "comments", "users"
  add_foreign_key "jobs", "users"
  add_foreign_key "pictures", "jobs"
end