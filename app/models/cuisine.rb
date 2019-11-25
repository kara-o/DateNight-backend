class Cuisine < ApplicationRecord
  has_many :cuisines_requests
  has_many :requests, through: :cuisines_requests
end
