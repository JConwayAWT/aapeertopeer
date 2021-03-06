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

ActiveRecord::Schema.define(version: 20140902015334) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consuming_enrollments", force: true do |t|
    t.integer  "user_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrollments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "subject_id"
  end

  create_table "providing_enrollments", force: true do |t|
    t.integer  "user_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", force: true do |t|
    t.string   "time"
    t.string   "status"
    t.text     "rejection_message"
    t.text     "additional_information"
    t.decimal  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subject_id"
    t.integer  "learner_id"
    t.integer  "tutor_id"
  end

  create_table "session_reviews", force: true do |t|
    t.date     "date"
    t.integer  "knows_and_understands"
    t.integer  "explains_clearly"
    t.integer  "asks_me_questions"
    t.integer  "listens_and_understands"
    t.integer  "checks_my_understanding"
    t.integer  "is_patient"
    t.integer  "is_friendly"
    t.integer  "alternative_explanations"
    t.integer  "accomodates"
    t.integer  "uses_aids"
    t.integer  "on_time"
    t.integer  "overall_helpful"
    t.text     "additional_comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tutor_id"
    t.integer  "learner_id"
    t.integer  "subject_id"
    t.integer  "request_id"
  end

  create_table "statics", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tutor_applications", force: true do |t|
    t.string   "full_name"
    t.integer  "grade"
    t.string   "email"
    t.string   "times_available"
    t.string   "subjects"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "transcript_file_name"
    t.string   "transcript_content_type"
    t.integer  "transcript_file_size"
    t.datetime "transcript_updated_at"
    t.string   "letters_of_recommendation_file_name"
    t.string   "letters_of_recommendation_content_type"
    t.integer  "letters_of_recommendation_file_size"
    t.datetime "letters_of_recommendation_updated_at"
    t.integer  "user_id"
    t.text     "classes_and_grades"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "is_admin"
    t.boolean  "is_tutor"
    t.boolean  "is_student"
    t.string   "skype_id"
    t.string   "times_available"
    t.string   "additional_information"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "google_calendar_link"
    t.datetime "last_active_time"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
