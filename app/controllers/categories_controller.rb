class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @products = Product.where.not(id: @category.products.pluck(:id))
  end

  def new
      @category = Category.new
      render 'edit'
  end

  def create
      @category = Category.new(category_params)

      respond_to do |format|
       if @category.save
         format.html { redirect_to categories_path, notice: 'Category successfully created' }
         format.json { render json: @category, status: :created, location: @category }
       else
         format.json { render json: @category.errors, status: :unprocessable_entity }
       end
     end
  end

  def edit
      @category = Category.find(params[:id])
  end

  def update
      @category = Category.find(params[:id])

      respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to categories_path, notice: 'Category successfully updated' }
          format.json { render json: @category, status: :created, location: @category }
        else
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
  end

    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      redirect_to categories_path
  end

  private
      def category_params
          params.require(:category).permit(:name, :description)
      end

end
