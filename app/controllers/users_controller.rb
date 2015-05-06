class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    if params[:id].nil?
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    @items = @user.items
    @item = Item.new
    @item.user = current_user
  end
end
