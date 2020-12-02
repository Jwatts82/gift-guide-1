class ApplicationController < ActionController::Base

    def welcome
    end

    def authentication 
        if !user_signed_in? 
          redirect_to '/'
        end 
    end 
    
end
