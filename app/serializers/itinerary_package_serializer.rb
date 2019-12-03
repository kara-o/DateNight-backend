class ItineraryPackageSerializer < ActiveModel::Serializer
  attributes :id, :neighborhood, :price_range, :title, :blurb, :itinerary_package_items

  def neighborhood
    Neighborhood.find(self.object.neighborhood_id).name
  end

  def price_range
    PriceRange.find(self.object.price_range_id).max_amount
  end

end
