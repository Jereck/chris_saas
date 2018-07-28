class ProfilesController < ApplicationController
    # GET to /users/:user_id/profile/new
    def new
        # Render blank profile detials form
        @profile = Profile.new
    end

    def create
        # Endure that we have the user who is filling out form
        @user = User.find( params[:user_id] )

        # Create profile link based on specific user
        @profile = @user.build_profile( profile_params )

        if @profile.save
            flash[:success] = "Profile Updated!"
            redirect_to user_path( params[:user_id] )
        else
            render action: :new
        end
    end

    private
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :avatar, :phone_number, :contact_email, :description)
        end
end