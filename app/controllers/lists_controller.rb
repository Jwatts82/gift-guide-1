class ListsController < ApplicationController

    def index
        if user_signed_in?
            @lists = current_user.lists.uniq
        else
            redirect_to '/'
        end
    end

    def show
        if user_signed_in?
            @list = current_user.lists.find_by(id: params[:id])
            if @list
                @gifts = current_user.gifts.where(list_id: params[:id])
                render :show
            end

        else
            redirect_to '/'
        end

    end
    
end
