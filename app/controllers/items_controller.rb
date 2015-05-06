class ItemsController < ApplicationController
  
  def create
  	@item = current_user.items.build(item_params)
  	@item.save
  		
	  	respond_to do |format|
	  		format.html { redirect_to root_path }
	  		format.js
	  	end
  	end

  private

  def item_params
  	params.require(:item).permit(:name)
  end

end
