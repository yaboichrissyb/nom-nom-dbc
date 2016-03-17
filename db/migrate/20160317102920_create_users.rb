class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :email
      t.string  :hashed_password
      t.string  :diet_res, :default => "none"

      t.timestamps null: false
    end
  end
end
