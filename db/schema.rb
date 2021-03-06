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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110628075057) do

  create_table "jobs", :force => true do |t|
    t.string   "code"
    t.string   "input_name"
    t.integer  "length_in_seconds"
    t.integer  "size_in_mb"
    t.string   "status"
    t.string   "owner"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "machine_id"
  end

  create_table "machines", :force => true do |t|
    t.string   "status"
    t.string   "url"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "video_artifacts", :force => true do |t|
    t.string   "name"
    t.string   "output"
    t.string   "params"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_id"
  end

end
