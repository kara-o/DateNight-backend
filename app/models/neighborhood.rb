class Neighborhood < ApplicationRecord
  has_many :neighborhoods_requests
  has_many :requests, through: :neighborhoods_requests
end
