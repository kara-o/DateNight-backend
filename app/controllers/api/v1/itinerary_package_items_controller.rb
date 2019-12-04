class Api::V1::ItineraryPackageItemsController < ApplicationController
  before_action :authenticate_admin!

  def create
    pkg_item = ItineraryPackageItem.create({
      itinerary_package_id: params[:itinerary_package_id],
      duration: params[:duration],
      address: params[:address],
      place: params[:place],
      blurb: params[:blurb],
      make_res_link: params[:make_res_link],
      map: params[:map]
    })

    if pkg_item.valid?
      render json: pkg_item, status: :created
    else
      render json: { errors: { error_obj: pkg_item.errors.messages, full_messages: pkg_item.errors.full_messages} }, status: :not_acceptable
    end 
  end

  def index
    pkg_items = ItineraryPackageItem.where(itinerary_package_id: params[:itinerary_package_id])
    render json: pkg_items
  end

  def destroy
    ItineraryPackageItem.destroy(params[:id])
  end 

  private

  def pkg_item_params
    params.require(:itinerary_package_item).permit(:itinerary_package_id, :time, :address, :place, :blurb, :make_res_link, :map)
  end

end
