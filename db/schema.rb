# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_220_818_170_812) do
  create_table 'carts', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'user_id', null: false
    t.bigint 'product_id', null: false
    t.integer 'quantity', default: 1
    t.index ['product_id'], name: 'index_carts_on_product_id'
    t.index ['user_id'], name: 'index_carts_on_user_id'
  end

  create_table 'payments', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name'
    t.integer 'pincode'
    t.string 'locality'
    t.string 'city'
    t.string 'state'
    t.string 'address'
    t.string 'expiry'
    t.integer 'cvv'
    t.string 'card_holder'
    t.integer 'number_of_items'
    t.integer 'total_price'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'product_title'
    t.bigint 'user_id', null: false
    t.bigint 'card_number'
    t.bigint 'number'
    t.index ['user_id'], name: 'index_payments_on_user_id'
  end

  create_table 'products', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'brand'
    t.text 'description'
    t.string 'title'
    t.decimal 'price', precision: 5, scale: 2, default: '0.0'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'image'
  end

  create_table 'reviews', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'comment_box'
    t.bigint 'user_id', null: false
    t.bigint 'product_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'rating'
    t.index ['product_id'], name: 'index_reviews_on_product_id'
    t.index ['user_id'], name: 'index_reviews_on_user_id'
  end

  create_table 'users', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'name'
    t.boolean 'admin', default: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'wishes', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'users_id'
    t.bigint 'products_id'
    t.index ['products_id'], name: 'index_wishes_on_products_id'
    t.index ['users_id'], name: 'index_wishes_on_users_id'
  end

  add_foreign_key 'carts', 'products'
  add_foreign_key 'carts', 'users'
  add_foreign_key 'payments', 'users'
  add_foreign_key 'reviews', 'products'
  add_foreign_key 'reviews', 'users'
  add_foreign_key 'wishes', 'products', column: 'products_id'
  add_foreign_key 'wishes', 'users', column: 'users_id'
end
