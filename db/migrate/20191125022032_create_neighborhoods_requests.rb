class CreateNeighborhoodsRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :neighborhoods_requests do |t|
      t.integer :neighborhood_id
      t.integer :request_id
    end
  end
end
