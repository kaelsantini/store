class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
      @product = Product.new
      @categories = Category.all
      render 'edit'
  end

  def create
      @product = Product.new(product_params)
      respond_to do |format|
       if @product.save
         format.html { redirect_to products_path, notice: 'Product successfully created' }
         format.json { render json: @product, status: :created, location: @product }
       else
         format.json { render json: @product.errors, status: :unprocessable_entity }
       end
     end
  end

  def edit
      @product = Product.find(params[:id])
      @categories = Category.all
  end

  def update
      @product = Product.find(params[:id])

      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to products_path, notice: 'product successfully updated' }
          format.json { render json: @product, status: :created, location: @product }
        else
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
  end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to products_path
  end

  private
      def product_params
          params.require(:product).permit(:name, :price, :category_id)
      end

end
