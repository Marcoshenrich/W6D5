class CatRentalRequestsController < ApplicationController

    def new
        @cats = Cat.all
        if params[:cat_id]
            @cat = Cat.find_by(id: params[:cat_id])
        end
        @cat_rental_request = CatRentalRequest.new
    end

    def create
        @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
        if @cat_rental_request.save
            redirect_to cat_url(@cat_rental_request.cat_id)
        else
            @requested = false
            redirect_to new_cat_cat_rental_requests_url(@cat_rental_request.cat_id)
        end
    end

    private
    def cat_rental_request_params
        params.require(:cat_rental_request).permit(:status, :start_date, :end_date, :cat_id)
    end
end