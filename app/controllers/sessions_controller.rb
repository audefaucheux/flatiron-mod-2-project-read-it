class SessionsController < ApplicationController

    def new
    end
    
    def create
        @user = User.find_by(email_address: params[:email_address])

        if @user == nil
            redirect_to login_path
            flash[:errors] = ["No logged in!"]
        else 
            if @user.authenticate(params[:password])
                session[:user_id] = @user.id
                flash[:notices] = ["Logged in!"]
                redirect_to root_path
            else 
                flash[:errors] = ["Not logged in!"]
                redirect_to login_path
            end
        end
    end

    def destroy
        reset_session
        redirect_to login_path
    end

end
