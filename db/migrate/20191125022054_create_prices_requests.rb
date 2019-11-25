class CreatePricesRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :prices_requests do |t|
      t.integer :price_id
      t.integer :request_id
    end
  end
end
