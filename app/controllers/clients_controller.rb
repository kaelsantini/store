class ClientsController < ApplicationController
  
  before_action :set_order, except: [:pre_add_product]

  def set_order
    if session[:order_id]
      @order = Order.find( session[:order_id] )
    else
      @order = Order.create(client_id: session[:client_id], completed: false)
      @order.save
      session[:order_id] = @order.id
    end
  end

  def index
    @categories = Category.all
  end
  
  def pre_add_product
  	@product = Product.find(params[:product])
  	render json: @product
  end

  def add_product
    product_params
    
    quantity = params[:quantity].to_i
    if quantity > 0
      product = Product.find(params[:product])
      @order.add_product(product, quantity)
      @order.save
    end

    render json: @order.order_product
  end

  private
      def product_params
          params.permit(:product, :quantity)
      end

end
