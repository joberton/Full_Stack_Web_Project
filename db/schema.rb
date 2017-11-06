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

ActiveRecord::Schema.define(version: 20171106175112) do

  create_table "consoles", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.text "description"
    t.date "date_released"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_type_id"
    t.index ["product_type_id"], name: "index_consoles_on_product_type_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.text "description"
    t.date "date_released"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "console_id"
    t.integer "genre_id"
    t.integer "product_type_id"
    t.index ["console_id"], name: "index_games_on_console_id"
    t.index ["genre_id"], name: "index_games_on_genre_id"
    t.index ["product_type_id"], name: "index_games_on_product_type_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
