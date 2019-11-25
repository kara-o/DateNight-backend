class Price < ApplicationRecord
  has_many :prices_requests
  has_many :requests, through: :prices_requests
end
