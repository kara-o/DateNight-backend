class CuisinesRequest < ApplicationRecord
  belongs_to :cuisine 
  belongs_to :request
end