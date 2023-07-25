class MainController < AboutController
    def index
        flash.now[:notice] = "Successfully initiated"
        flash.now[:alert] = "Something wrong happened"
    end
end
