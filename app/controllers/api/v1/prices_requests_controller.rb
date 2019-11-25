class Api::V1::PricesRequestsController < ApplicationController

  def create
    prices_request = PricesRequest.create(request_id: params[:request_id], price_id: params[:price_id])
  end

end
