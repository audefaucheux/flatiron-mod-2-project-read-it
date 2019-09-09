class SessionsController < ApplicationController

    def new
    end
    
    def create
        if params[:email_address].nil? || params[:email_address].empty?
            redirect_to login_path
        else
            @user = User.find_by(email_address: params[:email_address])
            return head(:forbidden) unless @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to root_path
        end
    end

    def destroy
        reset_session
        redirect_to login_path
    end

end
