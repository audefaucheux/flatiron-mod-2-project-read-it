class UsersController < ApplicationController

    before_action :current_user, except: [:new, :create]
    before_action :find_user, only: [:edit, :update]

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

    def edit  
        @user = @current_user
    end

    def update
        @user.update(user_params)
        @user.save
        flash[:notices] = ["User updated"]
        redirect_to edit_user_path(@user)
    end

    def reading_list
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:email_address, :password, :password_confirmation)
    end

    def find_user
        @user = User.find(params[:id])
    end

end
