class AddAdminToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :admin, :boolean, :default => true
  end
end
