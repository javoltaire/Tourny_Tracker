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

ActiveRecord::Schema.define(version: 20161223221116) do

  create_table "game_types", force: :cascade do |t|
    t.string   "game_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_type"], name: "index_game_types_on_game_type", unique: true
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.integer  "team_count"
    t.integer  "group_count"
    t.integer  "max_teammates"
    t.string   "status"
    t.integer  "game_type_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["game_type_id"], name: "index_tournaments_on_game_type_id"
    t.index ["name"], name: "index_tournaments_on_name", unique: true
  end

  create_table "tournaments_users", id: false, force: :cascade do |t|
    t.integer "tournament_id"
    t.integer "user_id"
    t.index ["tournament_id"], name: "index_tournaments_users_on_tournament_id"
    t.index ["user_id"], name: "index_tournaments_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
