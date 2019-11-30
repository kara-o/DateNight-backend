class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.datetime :date
      t.datetime :start_time
      t.datetime :end_time
      t.string :neighborhood
      t.integer :party_size
      t.string :price_range
      t.text :notes
      t.integer :user_id
      t.boolean :fulfilled, default: 'false'
      t.boolean :cancelled, default: 'false'

      t.timestamps
    end
  end
end
