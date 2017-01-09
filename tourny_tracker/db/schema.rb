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

ActiveRecord::Schema.define(version: 20170109155038) do

  create_table "elimination_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_elimination_types_on_name", unique: true
  end

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_names", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_group_names_on_name", unique: true
  end

  create_table "grouping_infos", force: :cascade do |t|
    t.integer  "elimination_type_id"
    t.integer  "group_count"
    t.integer  "teams_per_group"
    t.integer  "playoffs_advanced"
    t.integer  "tournament_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["elimination_type_id"], name: "index_grouping_infos_on_elimination_type_id"
    t.index ["tournament_id"], name: "index_grouping_infos_on_tournament_id"
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "group_name_id"
    t.integer  "tournament_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["group_name_id"], name: "index_groups_on_group_name_id"
    t.index ["tournament_id"], name: "index_groups_on_tournament_id"
  end

  create_table "teammates", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.integer  "tournament_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["team_id"], name: "index_teammates_on_team_id"
    t.index ["tournament_id"], name: "index_teammates_on_tournament_id"
    t.index ["user_id"], name: "index_teammates_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "points",     default: 0
    t.integer  "group_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["group_id"], name: "index_teams_on_group_id"
    t.index ["name"], name: "index_teams_on_name", unique: true
  end

  create_table "tournament_games", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournament_states", force: :cascade do |t|
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state"], name: "index_tournament_states_on_state", unique: true
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.integer  "team_count"
    t.boolean  "use_grouping"
    t.integer  "elimination_type_id"
    t.integer  "team_size"
    t.integer  "game_id"
    t.integer  "tournament_state_id"
    t.integer  "created_by"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["elimination_type_id"], name: "index_tournaments_on_elimination_type_id"
    t.index ["game_id"], name: "index_tournaments_on_game_id"
    t.index ["tournament_state_id"], name: "index_tournaments_on_tournament_state_id"
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
