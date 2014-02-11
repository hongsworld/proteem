class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string "menu"
      t.string "price"
      t.string "img_url"
      t.integer "post_id"
      t.timestamps
    end
  end
end
