class RequestSerializer < ActiveModel::Serializer
  attributes :id, :date, :start, :end, :size, :cuisines, :neighborhoods, :prices, :created_at, :status, :user

  def date
    self.object.date.in_time_zone("Pacific Time (US & Canada)").strftime('%-m/%-d/%Y')
  end 

  def start 
    self.object.start_time.in_time_zone("Pacific Time (US & Canada)").strftime('%l:%M %p')
  end 

  def end
    self.object.end_time.in_time_zone("Pacific Time (US & Canada)").strftime('%l:%M %p')
  end 

  def cuisines
    result = []
    self.object.cuisines_requests.each do |c|
      result << Cuisine.find(c.cuisine_id)
    end 
    result
  end 

  def neighborhoods
    result = []
    self.object.neighborhoods_requests.each do |n|
      result << Neighborhood.find(n.neighborhood_id)
    end 
    result
  end 

  def prices 
    result = []
    self.object.prices_requests.each do |p|
      result << Price.find(p.price_id)
    end 
    result
  end 

  def created_at
    self.object.created_at.strftime('Created on %m/%d/%Y at %l:%M%p')
  end 

  def updated_at
    self.object.updated_at.strftime('Edited on %m/%d/%Y at %l:%M%p')
  end 

  def user
    user = User.find(self.object.user_id)
    UserSerializer.new(user)
  end 
end