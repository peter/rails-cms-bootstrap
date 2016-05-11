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

ActiveRecord::Schema.define(version: 20160511113347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "changes", force: :cascade do |t|
    t.integer  "user_id",          null: false
    t.string   "controller",       null: false
    t.string   "action",           null: false
    t.text     "params",           null: false
    t.text     "model_attributes"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "layouts", force: :cascade do |t|
    t.string   "name",       null: false
    t.jsonb    "sections",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "page_versions", force: :cascade do |t|
    t.integer  "page_id",                          null: false
    t.integer  "version_number",                   null: false
    t.string   "title"
    t.string   "path"
    t.text     "body"
    t.jsonb    "doc",            default: "{}",    null: false
    t.string   "status",         default: "draft"
    t.datetime "publish_at"
    t.datetime "unpublish_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title",                            null: false
    t.string   "path",                             null: false
    t.integer  "layout_id",                        null: false
    t.text     "body"
    t.integer  "site_id",                          null: false
    t.integer  "version_number",                   null: false
    t.jsonb    "doc",            default: "{}",    null: false
    t.string   "status",         default: "draft"
    t.datetime "publish_at"
    t.datetime "unpublish_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["path", "site_id"], name: "index_pages_on_path_and_site_id", unique: true, using: :btree
  end

  create_table "published_paths", force: :cascade do |t|
    t.string   "path",       null: false
    t.integer  "site_id",    null: false
    t.integer  "item_id",    null: false
    t.string   "item_type",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["path", "site_id"], name: "index_published_paths_on_path_and_site_id", unique: true, using: :btree
  end

  create_table "sites", force: :cascade do |t|
    t.string   "key",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_sites_on_key", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "widgets", force: :cascade do |t|
    t.string   "type",       null: false
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "changes", "users", name: "changes_user_id_fk", on_delete: :cascade
  add_foreign_key "page_versions", "pages", name: "page_versions_page_id_fk", on_delete: :cascade
  add_foreign_key "pages", "layouts", name: "pages_layout_id_fk", on_delete: :cascade
  add_foreign_key "pages", "sites", name: "pages_site_id_fk", on_delete: :cascade
end
