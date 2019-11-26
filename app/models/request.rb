class Request < ApplicationRecord
  belongs_to :user
  has_many :cuisines_requests, inverse_of: :request
  has_many :cuisines, through: :cuisines_requests
  has_many :neighborhoods_requests, inverse_of: :request
  has_many :neighborhoods, through: :neighborhoods_requests
  has_many :prices_requests, inverse_of: :request
  has_many :prices, through: :prices_requests
  has_one :itinerary

  accepts_nested_attributes_for :cuisines_requests, reject_if: proc { |attributes| attributes['cuisine_id'].blank? }
  accepts_nested_attributes_for :neighborhoods_requests, reject_if: proc { |attributes| attributes['neighborhood_id'].blank? }
  accepts_nested_attributes_for :prices_requests, reject_if: proc { |attributes| attributes['price_id'].blank? }

  #TODO - make date only be today and future
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :size, presence: true
  validate :request_date_cannot_be_in_the_past

  def request_date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end
 
end
