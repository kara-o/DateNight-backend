class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.datetime :date
      t.datetime :start_time
      t.datetime :end_time
      t.string :cuisine
      t.string :neighborhood
      t.string :price
      t.integer :user_id
      t.integer :itinerary_id

      t.timestamps
    end
  end
end
