class CreateCuisinesRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :cuisines_requests do |t|
      t.integer :cuisine_id
      t.integer :request_id
    end
  end
end
