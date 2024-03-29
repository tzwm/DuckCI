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

ActiveRecord::Schema.define(version: 20150607034253) do

  create_table "audit_logs", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,   null: false
    t.string   "action",     limit: 255, null: false
    t.integer  "project_id", limit: 4,   null: false
    t.integer  "build_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "audit_logs", ["action"], name: "index_audit_logs_on_action", using: :btree
  add_index "audit_logs", ["project_id"], name: "index_audit_logs_on_project_id", using: :btree
  add_index "audit_logs", ["user_id"], name: "index_audit_logs_on_user_id", using: :btree

  create_table "builds", force: :cascade do |t|
    t.integer  "project_id",    limit: 4,     null: false
    t.string   "commit",        limit: 255
    t.string   "state",         limit: 255
    t.integer  "exit_status",   limit: 4
    t.text     "stderr",        limit: 65535
    t.text     "stdout",        limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "author",        limit: 255
    t.integer  "building_time", limit: 4
  end

  create_table "machines", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "url",        limit: 255, null: false
    t.string   "login_user", limit: 255, null: false
    t.string   "state",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "machines", ["state"], name: "index_machines_on_state", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name",              limit: 255,                      null: false
    t.string   "uri",               limit: 255,                      null: false
    t.string   "branch",            limit: 255,   default: "master", null: false
    t.text     "script",            limit: 65535
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.text     "dockerfile",        limit: 65535
    t.string   "docker_uri",        limit: 255
    t.integer  "avg_building_time", limit: 4
    t.integer  "builds_count",      limit: 4,     default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",       null: false
    t.string   "encrypted_password",     limit: 255, default: "",       null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.string   "role",                   limit: 255, default: "normal", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role"], name: "index_users_on_role", using: :btree

end
