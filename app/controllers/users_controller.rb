class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user = User.create(user_params)

        if user.valid?
            session[:user_id] = user.id
            redirect_to root_path
        else
            flash[:errors] = user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def reading_list
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:email_address, :password, :password_confirmation)
    end

end
