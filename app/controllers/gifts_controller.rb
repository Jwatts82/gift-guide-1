class GiftsController < ApplicationController
    before_action :authentication

    def index
        @gifts = current_user.gifts
    end

    def new
        @gift = current_user.gifts.new(list_id: params[:list_id])
    end

    def create
        binding.pry
        @gift = current_user.gifts.build(gift_params)
        #binding.pry
        if @gift.save
            redirect_to gift_path(@gift)
        else
            render :new
        end
    end

    def show

    end
    
    def edit

    end

    def update

    end

    def delete

    end

    private
    #strong params with keys, has many 
    def gift_params
        params.require(:gift).permit(
            :name,
            :store,
            :price,
            :comment,
            :list_id,
            list_attributes: [
                :name
            ]
        )
    end

end
