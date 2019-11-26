class CuisinesRequest < ApplicationRecord
  belongs_to :cuisine 
  belongs_to :request, inverse_of: :cuisines_requests
  validates_presence_of :request
end