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

ActiveRecord::Schema.define(version: 20180521184027) do

  create_table "collaborations", force: :cascade do |t|
    t.integer "node_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["node_id"], name: "index_collaborations_on_node_id"
    t.index ["user_id"], name: "index_collaborations_on_user_id"
  end

  create_table "farms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_farms_on_user_id"
  end

  create_table "grooves", force: :cascade do |t|
    t.integer "quantity"
    t.integer "lot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lot_id"], name: "index_grooves_on_lot_id"
  end

  create_table "lots", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "farm_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "key"
    t.index ["farm_id"], name: "index_lots_on_farm_id"
  end

  create_table "nodes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reference"
  end

  create_table "plague_reports", force: :cascade do |t|
    t.date "reportDate"
    t.text "description"
    t.integer "groove_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["groove_id"], name: "index_plague_reports_on_groove_id"
  end

  create_table "sensors", force: :cascade do |t|
    t.string "name"
    t.integer "node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["node_id"], name: "index_sensors_on_node_id"
  end

  create_table "sick_plants", force: :cascade do |t|
    t.integer "location"
    t.integer "plague_report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plague_report_id"], name: "index_sick_plants_on_plague_report_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "values", force: :cascade do |t|
    t.string "value"
    t.integer "sensor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sensor_id"], name: "index_values_on_sensor_id"
  end

end
