class SessionsController < ApplicationController

    def new
    end
    
    def create
        @user = User.find_by(email_address: params[:email_address])

        # if !params[:email_address].present? || !params[:password].present? || !@user.authenticate(params[:password])
        #     redirect_to login_path
        # else
        # byebug
        if @user == nil
            redirect_to login_path
            flash[:errors] = ["Not logged in!"]
            # return head(:forbidden)
            # unless @user.authenticate(params[:password])
        else 
            if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash[:notices] = ["Logged in!"]
            redirect_to root_path
            else redirect_to login_path
            flash[:errors] = ["Not logged in!"]
            end
        end
    end

    def destroy
        reset_session
        redirect_to login_path
    end

end
