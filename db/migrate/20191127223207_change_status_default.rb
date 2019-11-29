class ChangeStatusDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :requests, :status, from: 'pending', to: 'requested'
  end
end
