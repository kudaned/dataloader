# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_06_174706) do

  create_table "carriers", force: :cascade do |t|
    t.integer "carrier_id"
    t.string "company_name"
    t.string "company_address_1"
    t.string "company_address_2"
    t.string "company_city"
    t.string "company_state"
    t.string "company_zip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.integer "client_id"
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "division"
    t.string "major_group"
    t.string "industry_group"
    t.string "sic"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "policies", force: :cascade do |t|
    t.string "policy_type"
    t.string "division"
    t.integer "carrier_id"
    t.integer "client_id"
    t.string "effective_date"
    t.string "expiration_date"
    t.string "written_preminum"
    t.string "carrier_policy_number"
    t.boolean "expiring"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
