class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :feedback, null: true
      t.integer :request_id
    end
  end
end
