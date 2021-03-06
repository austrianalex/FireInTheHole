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

ActiveRecord::Schema.define(:version => 20090806214819) do

  create_table "groups", :force => true do |t|
    t.string   "title"
    t.boolean  "user"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hydrants", :force => true do |t|
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "serviced"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "street"
    t.integer  "house_num"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string  "username", :null => false
    t.string  "first",    :null => false
    t.string  "last",     :null => false
    t.string  "password", :null => false
    t.integer "group_id", :null => false
  end

end
