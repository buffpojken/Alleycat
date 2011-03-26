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

ActiveRecord::Schema.define(:version => 20110326170928) do

  create_table "acts", :force => true do |t|
    t.integer  "story_id"
    t.string   "name"
    t.string   "act_key"
    t.string   "positioning"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position_id"
    t.string   "position_type"
    t.text     "content"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "icon_url"
    t.string   "parent_location_id"
    t.string   "foursquare_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.integer  "published",         :default => 0
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "typed_positionings", :force => true do |t|
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.integer  "fb_uid"
    t.string   "fb_access_token"
    t.string   "email"
    t.integer  "admin",            :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_story_id"
    t.integer  "current_act"
  end

end
