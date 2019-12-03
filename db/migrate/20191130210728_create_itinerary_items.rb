class CreateItineraryItems < ActiveRecord::Migration[6.0]
  def change
    create_table :itinerary_items do |t|
      t.integer :request_id
      t.integer :time
      t.string :address
      t.string :place
      t.text :blurb
      t.string :res_link, null: true
      t.string :make_res_link, null: true
      t.string :map
    end
  end
end
