class Api::V1::NeighborhoodsRequestsController < ApplicationController

  def create
    neighborhoods_request = NeighborhoodsRequest.create(request_id: params[:request_id], neighborhood_id: params[:neighborhood_id])
  end

end
