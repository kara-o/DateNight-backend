class Request < ApplicationRecord
  belongs_to :user
  belongs_to :neighborhood
  belongs_to :price_range
  has_many :itinerary_items
  has_many :contacts, inverse_of: :request

  accepts_nested_attributes_for :contacts, reject_if: proc { |attributes| attributes['phone'].blank? }
  
  # validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :size, presence: true
  validate :request_date_cannot_be_in_the_past

  # def request_date_cannot_be_in_the_past
  #   if date.present? && date < Date.today
  #     errors.add(:date, "can't be in the past")
  #   end
  # end
 
end
