class CatsController < ApplicationController
    

#index
    def index

    end

#new

#edit

#create

#update

#show

private
    def cat_params
        params.require(:cat).permit(:description, :name)
    end


end