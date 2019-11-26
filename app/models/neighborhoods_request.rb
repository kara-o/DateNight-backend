class NeighborhoodsRequest < ApplicationRecord
  belongs_to :neighborhood 
  belongs_to :request, inverse_of: :neighborhoods_requests
  validates_presence_of :request
end