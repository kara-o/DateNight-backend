class CreatePartners < ActiveRecord::Migration[6.0]
  def change
    create_table :partners do |t|
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end
end
