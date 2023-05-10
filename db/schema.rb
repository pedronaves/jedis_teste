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

ActiveRecord::Schema[7.0].define(version: 2023_05_09_235101) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "municipes", force: :cascade do |t|
    t.string "name", null: false
    t.integer "cpf", null: false
    t.integer "cns", null: false
    t.string "email", null: false
    t.integer "birthday", null: false
    t.integer "phone_country", null: false
    t.integer "phone_area", null: false
    t.integer "phone_number", null: false
    t.string "photo", null: false
    t.boolean "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
