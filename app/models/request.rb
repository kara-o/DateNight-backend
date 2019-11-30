class Request < ApplicationRecord
  belongs_to :user
  belongs_to :neighborhood
  belongs_to :price_range
  has_many :itinerary_items
  has_and_belongs_to_many :contacts

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
