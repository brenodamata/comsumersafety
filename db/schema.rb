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

ActiveRecord::Schema.define(version: 20160526003401) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drugs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "generic_name"
    t.string   "brand_name"
    t.string   "substance_name"
    t.string   "active_substance_name"
    t.string   "indication"
    t.string   "manufacturer"
    t.integer  "category_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["category_id"], name: "index_drugs_on_category_id", using: :btree
  end

  create_table "foods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "firm"
    t.string   "description"
    t.string   "country"
    t.string   "city"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_foods_on_category_id", using: :btree
  end

  create_table "medical_devices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "brand"
    t.string   "specialty"
    t.string   "manufacturer"
    t.integer  "category_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["category_id"], name: "index_medical_devices_on_category_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "manufacturer"
    t.string   "manufacturer_countries"
    t.string   "description"
    t.string   "model"
    t.string   "type"
    t.integer  "category_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
  end

  create_table "recalls", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "number"
    t.datetime "date"
    t.text     "description",       limit: 65535
    t.string   "url"
    t.string   "title"
    t.text     "consumer_contact",  limit: 65535
    t.datetime "last_publish_date"
    t.integer  "number_of_units"
    t.text     "injuries",          limit: 65535
    t.text     "hazards",           limit: 65535
    t.text     "remedies",          limit: 65535
    t.text     "retailers",         limit: 65535
    t.string   "country"
    t.integer  "recallable_id"
    t.string   "recallable_type"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_foreign_key "drugs", "categories"
  add_foreign_key "foods", "categories"
  add_foreign_key "medical_devices", "categories"
  add_foreign_key "products", "categories"
end
