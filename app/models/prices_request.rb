class PricesRequest < ApplicationRecord
  belongs_to :price
  belongs_to :request, inverse_of: :prices_requests
  validates_presence_of :request
end