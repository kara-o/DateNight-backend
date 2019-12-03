class Api::V1::NotificationsController < ApplicationController
  before_action :authenticate_admin!

  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']
  @client = Twilio::REST::Client.new(account_sid, auth_token) 

  def create_message
    # contacts = Contact.where(request_id: params[:request_id])
    contacts = ['12069102789']
    contacts.each do |number|
      message = @client.messages.create(
          body: 'DateNight test!',
          from: '+14079015704',
          to: number
      )
    end 
    puts message.status
  end 


end 