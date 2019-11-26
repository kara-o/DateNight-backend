class RequestSerializer < ActiveModel::Serializer
  attributes :id, :date, :window, :size, :cuisines_requests, :neighborhoods_requests, :prices_requests

  def window
    self.object.start_time.in_time_zone("Pacific Time (US & Canada)").strftime('%I:%M:%S %p') + ' - ' self.object.last_time.in_time_zone("Pacific Time (US & Canada)").strftime('%I:%M:%S %p')
  end 
end