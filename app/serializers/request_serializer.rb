class RequestSerializer < ActiveModel::Serializer
  attributes :id, :date, :start_time, :end_time, :size, :cuisines_requests, :neighborhoods_requests, :prices_requests
end