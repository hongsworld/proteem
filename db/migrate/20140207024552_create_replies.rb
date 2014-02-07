class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer "post_id"
      t.string "name"
      t.string "content"
      t.boolean "delete_flag"
      t.timestamps
    end
  end
end
