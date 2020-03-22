class ClientsController < ApplicationController
  
  def index
  	@categories = Category.all
  end

  
end
