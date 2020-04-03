class ApplicationController < ActionController::Base

    before_action :authorized
    helper_method :current_client
    helper_method :logged_in?

    def current_client
      Client.find_by(id: session[:client_id])
    end

    def logged_in?
      !current_client.nil?
    end

    def authorized
      if !logged_in?
        flash.alert = 'Restrict access area'
        redirect_to(:controller => 'login', :action => 'index')
      end
    end

end
