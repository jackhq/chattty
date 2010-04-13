# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100413133254) do

  create_table "activities", :force => true do |t|
    t.integer  "user_id"
    t.string   "body"
    t.string   "at_users"
    t.string   "topics"
    t.string   "people"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["at_users"], :name => "index_activities_on_at_users"
  add_index "activities", ["people"], :name => "index_activities_on_people"
  add_index "activities", ["topics"], :name => "index_activities_on_topics"

end
