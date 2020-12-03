class ApplicationController < ActionController::Base

    def welcome
      if user_signed_in? 
        redirect_to lists_path
      end
    end

    def authentication 
        if !user_signed_in? 
          redirect_to '/'
        end 
    end 

end

    