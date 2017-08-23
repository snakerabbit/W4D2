class CatRentalRequestsController < ApplicationController
  def index
    @rental_requests = CatRentalRequest.all
    if @rental_requests
      render :index
    else
      render json: CatRentalRequest.errors.full_messages, status: 404
    end
  end

  def new
    render :new
  end

  def create
    @rental_request = CatRentalRequest.new(request_params)
    if @rental_request.save!
      redirect_to cat_rental_request_url(@rental_request)
    else
      render :new
    end
  end

  def show
    @rental_request = CatRentalRequest.find_by(id: params[:id])
    unless @rental_request
      redirect_to cat_rental_request_url
    else
      render :show
    end
  end

  private

  def request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end
