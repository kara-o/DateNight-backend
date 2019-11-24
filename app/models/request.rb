class Request < ApplicationRecord
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :cuisine, presence: true
  validates :neighborhood, presence: true
  validates :price, presence: true
end
