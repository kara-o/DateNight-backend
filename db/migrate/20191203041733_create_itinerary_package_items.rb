class CreateItineraryPackageItems < ActiveRecord::Migration[6.0]
  def change
    create_table :itinerary_package_items do |t|
      t.integer :time
      t.string :address
      t.string :place
      t.text :blurb
      t.integer :itinerary_package_id
      t.string :make_res_link

      t.timestamps
    end
  end
end
