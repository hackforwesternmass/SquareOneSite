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

ActiveRecord::Schema.define(version: 20150622204849) do

  create_table "attendances", force: :cascade do |t|
    t.integer  "child_id"
    t.integer  "provider_id"
    t.date     "childTermDate"
    t.date     "dateOfService"
    t.datetime "timeIn"
    t.datetime "timeOut"
    t.string   "absent"
    t.string   "whoCreated"
    t.date     "dateCreated"
    t.string   "whoEdited"
    t.date     "dateEdited"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "absenceReason"
  end

  add_index "attendances", ["child_id"], name: "index_attendances_on_child_id"
  add_index "attendances", ["provider_id"], name: "index_attendances_on_provider_id"

  create_table "children", force: :cascade do |t|
    t.string   "fName"
    t.string   "middle"
    t.string   "lName"
    t.date     "dob"
    t.string   "fundSrc"
    t.integer  "trans"
    t.date     "startDate"
    t.integer  "provider_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.date     "terminationDate"
  end

  add_index "children", ["provider_id"], name: "index_children_on_provider_id"

  create_table "providers", force: :cascade do |t|
    t.string   "fName"
    t.string   "middle"
    t.string   "lName"
    t.string   "addr1"
    t.string   "addr2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "phone"
    t.string   "email"
    t.integer  "licenseCap"
    t.integer  "sqOneCap"
    t.date     "licenseExpDate"
    t.string   "certLevel"
    t.boolean  "sqOneRepl"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
