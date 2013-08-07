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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130807134704) do

  create_table "commits", :force => true do |t|
    t.string   "commit_id"
    t.string   "message"
    t.boolean  "distinct"
    t.datetime "commit_timestamp"
    t.string   "commit_url"
    t.integer  "author_id"
    t.integer  "committer_id"
    t.text     "added"
    t.text     "removed"
    t.text     "modified"
    t.boolean  "head_commit"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "status"
    t.string   "qa_url"
    t.string   "uat_url"
    t.string   "repo_url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "push_data", :force => true do |t|
    t.string   "ref"
    t.string   "after"
    t.string   "before"
    t.boolean  "created"
    t.boolean  "deleted"
    t.boolean  "forced"
    t.string   "compare"
    t.integer  "head_commit_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "repositories", :force => true do |t|
    t.string   "repository_id"
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.integer  "owner_id"
    t.boolean  "private"
    t.datetime "repository_created_at"
    t.datetime "repository_pushed_at"
    t.integer  "pusher_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "service"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
