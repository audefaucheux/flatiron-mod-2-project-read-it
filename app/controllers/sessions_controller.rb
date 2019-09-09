class SessionsController < ApplicationController

    def new
    end
    
    def create
        @user = User.find_by(email_address: params[:email_address])

        if !params[:email_address].present? || !params[:password].present? || !@user.authenticate(params[:password])
            redirect_to login_path
        else
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
