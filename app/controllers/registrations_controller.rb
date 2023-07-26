class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            #keep user sign in by using cookies, the problem is if using cookies anybody could access it, so it would be btter to use session instead
            session[:user_id]=@user.id


            #if user successfully created account it will redirect into root
            redirect_to root_path, notice: "Successfully created account"
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
