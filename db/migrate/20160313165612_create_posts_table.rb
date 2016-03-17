class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.integer :user_id
      t.integer :votes

      t.timestamps null: false
    end
  end
end
