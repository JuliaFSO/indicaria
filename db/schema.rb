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

ActiveRecord::Schema.define(version: 2021_06_09_144129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movie_picks", force: :cascade do |t|
    t.bigint "movies_id", null: false
    t.bigint "users_id", null: false
    t.boolean "watched", default: false
    t.boolean "recommended", default: false
    t.boolean "liked", default: false
    t.boolean "liked_movie", default: false
    t.boolean "watch_list", default: false
    t.boolean "accepted", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movies_id"], name: "index_movie_picks_on_movies_id"
    t.index ["users_id"], name: "index_movie_picks_on_users_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.text "overview"
    t.float "vote_average"
    t.integer "release_year"
    t.integer "runtime"
    t.string "genre"
    t.string "language"
    t.string "country"
    t.string "poster_url"
    t.string "trailer_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "id_apimovie"
    t.string "provider_name"
    t.string "provider_logo"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "favorite_genres"
    t.string "favorite_movies"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "movie_picks", "movies", column: "movies_id"
  add_foreign_key "movie_picks", "users", column: "users_id"
end
