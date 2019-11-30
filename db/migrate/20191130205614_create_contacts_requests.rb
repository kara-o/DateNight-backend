class CreateContactsRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts_requests do |t|
      t.belongs_to :contact
      t.belongs_to :request
    end
  end
end
