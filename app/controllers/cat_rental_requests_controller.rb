class CatRentalRequestsController < ApplicationController
  def new
  end

  def edit
  end

  def update
  end

  def create
    @request = CatRentalRequest.new(request_params)
    if @request.save
      redirect_to cats_url
    else
      render json: @request.errors.full_messages
    end
  end

  def index
    @requests = CatRentalRequest.all
    render :index
  end

  private

  def request_params
    params.require(:cat_rental_requests).permit(:cat_id, :start_date, :end_date, :status)
  end
end
