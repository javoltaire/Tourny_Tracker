class UsersController < ApplicationController
  
  # Action for showing a user's profile
  def show
    @user = User.find(params[:id])
  end
end
