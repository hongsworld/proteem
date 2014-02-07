class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string "name"
      t.integer "category" # 1. 카페, 베이커리 2. 음식점 3. 놀이
      t.string "detail_category" # 양식, pc방, 분식 등
      t.integer "location" #1. 온양1동 2. 온양2동 ~~ 6. 온양
      t.string "address"
      t.string "phone"
      t.string "menu_1"
      t.integer "cost_1"
      t.string "menu_2"
      t.integer "cost_2"
      t.string "menu_3"
      t.integer "cost_3"
      t.string "feature" # 특징
      t.boolean "delete_flag"
      t.timestamps
    end
  end
end
