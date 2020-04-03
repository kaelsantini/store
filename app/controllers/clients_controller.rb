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
    
    if session[:order]
      @order = Order.find( session[:order] )
    else
      @order = Order.create

    end

    @quantity = params[:quantity].to_i
    if @quantity > 0
      @product = Product.find(params[:product])
      @client_order.add(@product, @quantity)
    end

    session[:client_order] = @client_order

  end

  private
      def product_params
          params.permit(:product, :quantity)
      end

end
