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

ActiveRecord::Schema.define(version: 20180214010933) do

  create_table "logs", force: :cascade do |t|
    t.integer  "userid"
    t.integer  "quizid"
    t.string   "user"
    t.string   "quiz"
    t.integer  "score"
    t.datetime "time_of_occurence"
    t.string   "event"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "updated_by"
  end

  create_table "quizzes", force: :cascade do |t|
    t.text     "question1"
    t.text     "answer1"
    t.text     "question2"
    t.text     "answer2"
    t.text     "question3"
    t.text     "answer3"
    t.text     "question4"
    t.text     "answer4"
    t.text     "question5"
    t.text     "answer5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "check1"
    t.string   "check2"
    t.string   "check3"
    t.string   "check4"
    t.string   "check5"
    t.string   "input1"
    t.string   "input2"
    t.string   "input3"
    t.string   "input4"
    t.string   "input5"
    t.string   "distract11"
    t.string   "distract12"
    t.string   "distract13"
    t.string   "distract21"
    t.string   "distract22"
    t.string   "distract23"
    t.string   "distract31"
    t.string   "distract32"
    t.string   "distract33"
    t.string   "distract41"
    t.string   "distract42"
    t.string   "distract43"
    t.string   "distract51"
    t.string   "distract52"
    t.string   "distract53"
  end

  create_table "users", force: :cascade do |t|
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
    t.boolean  "is_admin"
    t.integer  "score"
    t.string   "lastanswer1"
    t.string   "lastanswer2"
    t.string   "lastanswer3"
    t.string   "lastanswer4"
    t.string   "lastanswer5"
    t.string   "name"
    t.integer  "perfect_scores",         default: 0
    t.integer  "quizzes_taken",          default: 0
    t.integer  "prestige",               default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
