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

ActiveRecord::Schema.define(version: 20170427065162) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "line_1"
    t.string   "line_2"
    t.string   "city"
    t.string   "state"
    t.string   "postcode"
    t.string   "country"
    t.string   "telephone"
    t.integer  "user_id"
    t.integer  "org_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.index ["org_id"], name: "index_addresses_on_org_id", using: :btree
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "bag_items", force: :cascade do |t|
    t.integer  "quantity"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "product_id"
    t.decimal  "unit_price",      precision: 12, scale: 3
    t.decimal  "total_price",     precision: 12, scale: 3
    t.integer  "donation_bag_id"
    t.index ["donation_bag_id"], name: "index_bag_items_on_donation_bag_id", using: :btree
    t.index ["product_id"], name: "index_bag_items_on_product_id", using: :btree
  end

  create_table "bag_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bags", force: :cascade do |t|
    t.string   "item"
    t.integer  "user_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "bag_status_id"
    t.integer  "total_items"
    t.decimal  "total_cost",    precision: 12, scale: 3
    t.index ["bag_status_id"], name: "index_bags_on_bag_status_id", using: :btree
    t.index ["user_id"], name: "index_bags_on_user_id", using: :btree
  end

  create_table "donation_bags", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bag_status_id"
    t.integer  "total_quantity"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "bag_item_id"
    t.index ["bag_item_id"], name: "index_donation_bags_on_bag_item_id", using: :btree
    t.index ["bag_status_id"], name: "index_donation_bags_on_bag_status_id", using: :btree
    t.index ["user_id"], name: "index_donation_bags_on_user_id", using: :btree
  end

  create_table "donation_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donations", force: :cascade do |t|
    t.integer  "donation_status_id"
    t.integer  "user_id"
    t.integer  "org_id"
    t.integer  "donation_bag_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["donation_bag_id"], name: "index_donations_on_donation_bag_id", using: :btree
    t.index ["donation_status_id"], name: "index_donations_on_donation_status_id", using: :btree
    t.index ["org_id"], name: "index_donations_on_org_id", using: :btree
    t.index ["user_id"], name: "index_donations_on_user_id", using: :btree
  end

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.string  "unsubscriber_type"
    t.integer "unsubscriber_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
    t.index ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree
  end

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.string   "sender_type"
    t.integer  "sender_id"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.string   "notified_object_type"
    t.integer  "notified_object_id"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
    t.index ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
    t.index ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
    t.index ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
    t.index ["type"], name: "index_mailboxer_notifications_on_type", using: :btree
  end

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.string   "receiver_type"
    t.integer  "receiver_id"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "is_delivered",               default: false
    t.string   "delivery_method"
    t.string   "message_id"
    t.index ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
    t.index ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "target_type",     null: false
    t.integer  "target_id",       null: false
    t.string   "notifiable_type", null: false
    t.integer  "notifiable_id",   null: false
    t.string   "key",             null: false
    t.string   "group_type"
    t.integer  "group_id"
    t.integer  "group_owner_id"
    t.string   "notifier_type"
    t.integer  "notifier_id"
    t.text     "parameters"
    t.datetime "opened_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["group_owner_id"], name: "index_notifications_on_group_owner_id", using: :btree
    t.index ["group_type", "group_id"], name: "index_notifications_on_group_type_and_group_id", using: :btree
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable_type_and_notifiable_id", using: :btree
    t.index ["notifier_type", "notifier_id"], name: "index_notifications_on_notifier_type_and_notifier_id", using: :btree
    t.index ["target_type", "target_id"], name: "index_notifications_on_target_type_and_target_id", using: :btree
  end

  create_table "orgs", force: :cascade do |t|
    t.string   "name"
    t.string   "org_type"
    t.string   "phone"
    t.string   "website"
    t.string   "logo"
    t.json     "images"
    t.integer  "user_id"
    t.string   "googleplaceid"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_orgs_on_user_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",       precision: 12, scale: 3
    t.boolean  "active"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "user_id"
    t.string   "description"
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "target_type",                             null: false
    t.integer  "target_id",                               null: false
    t.string   "key",                                     null: false
    t.boolean  "subscribing",              default: true, null: false
    t.boolean  "subscribing_to_email",     default: true, null: false
    t.datetime "subscribed_at"
    t.datetime "unsubscribed_at"
    t.datetime "subscribed_to_email_at"
    t.datetime "unsubscribed_to_email_at"
    t.text     "optional_targets"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["key"], name: "index_subscriptions_on_key", using: :btree
    t.index ["target_type", "target_id", "key"], name: "index_subscriptions_on_target_type_and_target_id_and_key", unique: true, using: :btree
    t.index ["target_type", "target_id"], name: "index_subscriptions_on_target_type_and_target_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
    t.string   "username"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "addresses", "orgs"
  add_foreign_key "addresses", "users"
  add_foreign_key "bag_items", "donation_bags"
  add_foreign_key "bag_items", "products"
  add_foreign_key "bags", "bag_statuses"
  add_foreign_key "bags", "users"
  add_foreign_key "donation_bags", "bag_items"
  add_foreign_key "donation_bags", "bag_statuses"
  add_foreign_key "donation_bags", "users"
  add_foreign_key "donations", "donation_bags"
  add_foreign_key "donations", "donation_statuses"
  add_foreign_key "donations", "orgs"
  add_foreign_key "donations", "users"
  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
  add_foreign_key "orgs", "users"
  add_foreign_key "products", "users"
end
