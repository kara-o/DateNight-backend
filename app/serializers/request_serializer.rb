class RequestSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time, :party_size, :neighborhood, :price_range, :user_id, :created_at, :updated_at, :fulfilled, :cancelled, :notes, :contacts, :itinerary_items

  def neighborhood
    Neighborhood.find(self.object.neighborhood_id).name
  end

  def price_range
    PriceRange.find(self.object.price_range_id).max_amount
  end 

  def created_at
    self.object.created_at.strftime('Created on %m/%d/%Y at %l:%M%p')
  end 

  def updated_at
    self.object.updated_at.strftime('Edited on %m/%d/%Y at %l:%M%p')
  end 
end