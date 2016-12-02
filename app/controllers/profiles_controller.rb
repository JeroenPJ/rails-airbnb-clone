class ProfilesController < ApplicationController
  def index
    puts params
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end
end
