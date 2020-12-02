class GiftsController < ApplicationController
    before_action :authentication
    before_action :set_gift, only: [:show, :edit, :update, :destroy]

    def index
        @gifts = current_user.gifts
    end

    def new
        @gift = current_user.gifts.new(list_id: params[:list_id])
        #binding.pry
    end

    def create
        #binding.pry
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
        if @gift.update(gift_params)
            redirect_to gift_path(@gift)
        else
            render :edit
        end
    end

    def destroy
        @gift.destroy
        redirect_to list_path(@gift.list)
    end

    private

    def set_gift
        @gift = current_user.gifts.find_by(id: params[:id])
        if !@gift
            flash[:error]  = "I'm sorry, you don't have access to view that page."
            redirect_to gifts_path
        end
    end

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
