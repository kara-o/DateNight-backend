class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.datetime :date
      t.datetime :start_time
      t.datetime :end_time
      t.integer :size
      t.integer :user_id
      t.integer :itinerary_id, null: true

      t.timestamps
    end
  end
end
