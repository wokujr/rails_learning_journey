class MainController < AboutController
    def index
        #check if user exist and logged in
        if session[:user_id]
            
            #find_by will act same like logged out if user/data deleted from database
            @user = User.find_by(id: session[:user_id])
        end
    end
end
