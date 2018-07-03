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

ActiveRecord::Schema.define(version: 2018_07_02_200818) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "companies", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "strasse"
    t.string "adresszusatz"
    t.string "stadt"
    t.integer "plz"
    t.string "ceo"
    t.string "beauftragter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "components", force: :cascade do |t|
    t.integer "section_id"
    t.string "category"
    t.string "heading"
    t.string "subheading"
    t.string "content"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formular_creators", force: :cascade do |t|
    t.string "name"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "heros", force: :cascade do |t|
    t.integer "page_id"
    t.string "style"
    t.string "header_slide_one"
    t.string "subheader_slide_one"
    t.string "button_slide_one"
    t.string "link_slide_one"
    t.string "header_slide_two"
    t.string "subheader_slide_two"
    t.string "button_slide_two"
    t.string "link_slide_two"
    t.string "header_slide_three"
    t.string "subheader_slide_three"
    t.string "button_slide_three"
    t.string "link_slide_three"
    t.string "header_slide_four"
    t.string "subheader_slide_four"
    t.string "button_slide_four"
    t.string "link_slide_four"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.integer "website_id"
    t.integer "user_id"
    t.integer "parent_id"
    t.string "parent_name"
    t.string "name"
    t.string "template"
    t.boolean "contact"
    t.boolean "map"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.integer "page_id"
    t.integer "position"
    t.string "category"
    t.string "header"
    t.string "subheader"
    t.string "background"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.integer "page_id"
    t.string "style"
    t.string "header_service_one"
    t.string "description_service_one"
    t.string "button_service_one"
    t.string "link_service_one"
    t.string "header_service_two"
    t.string "description_service_two"
    t.string "button_service_two"
    t.string "link_service_two"
    t.string "header_service_three"
    t.string "description_service_three"
    t.string "button_service_three"
    t.string "link_service_three"
    t.string "header_service_four"
    t.string "description_service_four"
    t.string "button_service_four"
    t.string "link_service_four"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.integer "website_id"
    t.string "primary_color"
    t.string "secondary_color"
    t.string "tertiary_color"
    t.string "background_color"
    t.string "font"
    t.string "font_color"
    t.string "header_color"
    t.string "footer_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer "company_id"
    t.string "role_name", default: "guest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "websites", force: :cascade do |t|
    t.integer "user_id"
    t.string "url"
    t.string "title"
    t.string "description"
    t.string "site_name"
    t.string "layout"
    t.string "header"
    t.string "footer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
