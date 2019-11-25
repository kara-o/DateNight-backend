class PricesRequest < ApplicationRecord
  belongs_to :price
  belongs_to :request
end