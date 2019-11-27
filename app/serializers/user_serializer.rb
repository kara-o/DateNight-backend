class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :first_name, :last_name, :join_date

  def join_date
    self.object.created_at.in_time_zone("Pacific Time (US & Canada)").strftime('%B %Y')
  end 

end
