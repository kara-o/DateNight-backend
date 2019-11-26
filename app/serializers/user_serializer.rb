class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :first_name, :last_name, :requests, :join_date

  def join_date
    self.object.created_at.in_time_zone("Pacific Time (US & Canada)").strftime('%B %Y')
  end 

  # def requests
  #   Request.find_by(user_id: self.object.id).collect do |r|
  #     RequestSerializer.new(r)
  #   end 
  # end 
end
