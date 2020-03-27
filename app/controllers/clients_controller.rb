class ClientsController < ApplicationController
  
  def index
  	@categories = Category.all
  end

  
  def pre_add_product
  	@product = Product.find(params[:id])
  	render json: @product
  end

end
