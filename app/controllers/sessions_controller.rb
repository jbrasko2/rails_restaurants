class SessionsController < ApplicationController

    def omniauth
        binding.pry

        user = User.create_from_omniauth(auth)
        if user.valid?
            session[:user_id] = user.id
            flash[:message] = "You have successfully signed in with Google Oauth"
            redirect_to restaurants_path
        else
            flash[:message] = user.errors.full_messages.join(", ")
            redirect_to cuisines_path
        end


    end

    private 
    def auth
        request.env['omniauth.auth']
    end
end