class Contact < ApplicationRecord
  belongs_to :request, inverse_of: :requests
  validates_presence_of :request
end