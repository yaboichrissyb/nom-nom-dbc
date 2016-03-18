class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.integer :cook_id
      t.integer :event_id
      t.text    :description
      t.string  :day

      t.timestamps null: false
    end
  end
end
