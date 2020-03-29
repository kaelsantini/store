class ClientsController < ApplicationController
  
  def index
  	@categories = Category.all
  end

  
  def pre_add_product
  	@product = Product.find(params[:product])
  	render json: @product
  end

  def add_product
    product_params

    if (session[:client_order])
      @client_order = session[:client_order]
    else
      @client_order = ClientOrder.create
      session[:client_order] = @client_order
    end

    @quantity = params[:quantity]
    if @quantity > 0
      @product = Product.find(params[:product])
    end

  end

  private
      def product_params
          params.permit(:product, :quantity)
      end

end
