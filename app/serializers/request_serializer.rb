class RequestSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time, :party_size, :neighborhood_id, :price_range_id, :user_id, :created_at, :updated_at, :fulfilled, :cancelled, :notes

  def created_at
    self.object.created_at.strftime('Created on %m/%d/%Y at %l:%M%p')
  end 

  def updated_at
    self.object.updated_at.strftime('Edited on %m/%d/%Y at %l:%M%p')
  end 
end