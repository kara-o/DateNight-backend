class Request < ApplicationRecord
  #TODO - make date only be today and future
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :size, presence: true
end
