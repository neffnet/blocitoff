class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    if params[:id].nil?
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end
end
