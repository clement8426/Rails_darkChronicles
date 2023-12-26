# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_12_26_151244) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.bigint "sheet_id", null: false
    t.integer "expression"
    t.integer "vigilances"
    t.integer "athletisme"
    t.integer "bagarre"
    t.integer "esquive"
    t.integer "empathie"
    t.integer "intimidation"
    t.integer "passe_passe"
    t.integer "commandement"
    t.integer "subterfuge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sheet_id"], name: "index_abilities_on_sheet_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "backgrounds", force: :cascade do |t|
    t.bigint "sheet_id", null: false
    t.string "name"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sheet_id"], name: "index_backgrounds_on_sheet_id"
  end

  create_table "disciplines", force: :cascade do |t|
    t.bigint "sheet_id", null: false
    t.string "name"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sheet_id"], name: "index_disciplines_on_sheet_id"
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "knowledges", force: :cascade do |t|
    t.bigint "sheet_id", null: false
    t.integer "erudition"
    t.integer "investigation"
    t.integer "droit"
    t.integer "linguistique"
    t.integer "medecine"
    t.integer "occulte"
    t.integer "sagesse_populaire"
    t.integer "politique"
    t.integer "senechal"
    t.integer "theologie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sheet_id"], name: "index_knowledges_on_sheet_id"
  end

  create_table "mental_attributes", force: :cascade do |t|
    t.bigint "sheet_id", null: false
    t.integer "perception"
    t.integer "intelligence"
    t.integer "wits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sheet_id"], name: "index_mental_attributes_on_sheet_id"
  end

  create_table "npcs", force: :cascade do |t|
    t.string "name"
    t.string "clan"
    t.string "secte"
    t.string "generation"
    t.string "address"
    t.string "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_npcs_on_user_id"
  end

  create_table "physical_attributes", force: :cascade do |t|
    t.bigint "sheet_id", null: false
    t.integer "strength"
    t.integer "dexterity"
    t.integer "stamina"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sheet_id"], name: "index_physical_attributes_on_sheet_id"
  end

  create_table "purses", force: :cascade do |t|
    t.bigint "sheet_id", null: false
    t.integer "livre"
    t.integer "deniers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sheet_id"], name: "index_purses_on_sheet_id"
  end

  create_table "sheets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pdf"
    t.string "title"
    t.string "Nom"
    t.string "Nature"
    t.string "Clan"
    t.string "Joueur"
    t.string "Attitude"
    t.integer "Génération"
    t.string "Chronique"
    t.string "Concept"
    t.string "Refuge"
    t.integer "Force"
    t.integer "Dextérité"
    t.integer "Vigueur"
    t.integer "Charisme"
    t.integer "Manipulation"
    t.integer "Apparence"
    t.integer "Perception"
    t.integer "Intelligence"
    t.integer "Astuce"
    t.integer "Expression"
    t.integer "Vigilances"
    t.integer "Athlétisme"
    t.integer "Bagarre"
    t.integer "Esquive"
    t.integer "Empathie"
    t.integer "Intimidation"
    t.integer "Passe"
    t.integer "Commandement"
    t.integer "Subterfuge"
    t.integer "Animaux"
    t.integer "Archerie"
    t.integer "Artisanats"
    t.integer "Equitation"
    t.integer "Etiquette"
    t.integer "Furtivité"
    t.integer "Commerce"
    t.integer "Mêlée"
    t.integer "Représentation"
    t.integer "Survie"
    t.integer "Erudition"
    t.integer "Investigation"
    t.integer "Droit"
    t.integer "Linguistique"
    t.integer "Médecine"
    t.integer "Occulte"
    t.integer "Sagesse"
    t.integer "Politique"
    t.integer "Sénéchal"
    t.integer "Théologie"
    t.integer "Volonté"
    t.integer "Consciences"
    t.integer "Maitrise"
    t.integer "Courage"
    t.integer "Livres"
    t.integer "Deniers"
    t.index ["user_id"], name: "index_sheets_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.bigint "sheet_id", null: false
    t.integer "animaux"
    t.integer "archerie"
    t.integer "artisanats"
    t.integer "equitation"
    t.integer "etiquette"
    t.integer "furtivite"
    t.integer "commerce"
    t.integer "melee"
    t.integer "representation"
    t.integer "survie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sheet_id"], name: "index_skills_on_sheet_id"
  end

  create_table "social_attributes", force: :cascade do |t|
    t.bigint "sheet_id", null: false
    t.integer "charisma"
    t.integer "manipulation"
    t.integer "appearance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sheet_id"], name: "index_social_attributes_on_sheet_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account_type"
    t.string "description"
    t.float "latitude"
    t.float "longitude"
    t.string "name"
    t.bigint "group_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "abilities", "sheets"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "backgrounds", "sheets"
  add_foreign_key "disciplines", "sheets"
  add_foreign_key "groups", "users"
  add_foreign_key "knowledges", "sheets"
  add_foreign_key "mental_attributes", "sheets"
  add_foreign_key "npcs", "users"
  add_foreign_key "physical_attributes", "sheets"
  add_foreign_key "purses", "sheets"
  add_foreign_key "sheets", "users"
  add_foreign_key "skills", "sheets"
  add_foreign_key "social_attributes", "sheets"
  add_foreign_key "users", "groups"
end
