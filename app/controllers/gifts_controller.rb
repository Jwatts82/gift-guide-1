class GiftsController < ApplicationController
    before_action :authentication

    def index
        @gifts = current_user.gifts
    end

    def new
        @gift = current_user.gifts.new
    end

    def create
        @gift = current_user.gifts.build(gift_params)
        if @gift.valid?
            @gift.save
            redirect_to @gift
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
            :comment,
            :store,
            :price,
            :list_id,
            list_attributes: [
                :name
            ]
        )
    end

end
