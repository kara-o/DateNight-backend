# require 'twilio-ruby'

class Api::V1::TextsController < ApplicationController
  before_action :authenticate_admin!

  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def create
    request = Request.find(params[:request_id])
    contacts = request.contacts

    # DEMO HACK - pretend to wait to till time by just sleeping for a bit
    request.itinerary_items.each_with_index do |item, item_idx|
      contacts.each do |contact|
        body = ""
        if item_idx == 0
          body = "Your itinerary is ready! Your first stop is #{item.place} - #{item.map_url}"
        else
          body = "Get ready, in 15 minutes you're heading to #{item.place} - #{item.map_url}"
        end
        message = @client.messages.create(
            body: body,
            from: '+14079015704',
            to: contact.phone,
        )
        puts message.status
      end

      sleep 10
    end
  end 

end 