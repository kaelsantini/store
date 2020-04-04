class LoginController < ApplicationController
  
  skip_before_action :authorized

  def index
    if !session[:client_id].blank?
      redirect_to '/clients/home'
    else
      @client = Client.new
    end
  end

  def login
    @client = Client.find_by(email: params[:email].downcase)
    if !@client
      flash.notice = 'Invalid e-mail'
      redirect_to :action => 'index'
    else
      session[:client_id] = @client.id
      redirect_to(:controller => 'clients', :action => 'index')
    end
  end

end
