class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string  :name
      t.integer :creator_id
      t.date    :start_date
      t.date    :end_date
      t.integer :max_people
      t.text    :theme, :default => "none"

      t.timestamps null: false
    end
  end
end
