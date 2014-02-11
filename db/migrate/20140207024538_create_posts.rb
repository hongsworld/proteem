class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string "name"
      t.integer "category" # 1. 카페, 베이커리 2. 음식점 3. 놀이
      t.string "detail_category" # 양식, pc방, 분식 등
      t.integer "location" #1. 온양1동 2. 온양2동 ~~ 6. 온양
      t.string "address"
      t.string "phone"
      t.string "feature" # 특징
      t.boolean "delete_flag" , :default => false
      t.string "img_url"
      t.string "dummy1"
      t.string "dummy2"
      t.string "dummy3"
      t.string "dummy4"
      t.timestamps
    end
  end
end
