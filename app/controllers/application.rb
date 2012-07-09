# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  helper_method :production?

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  # protect_from_forgery # :secret => '8651efc1f0d1253bdbeda0b225bf1705'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  filter_parameter_logging :password
       
  def login_required
    unless session[:admin]
      flash[:notice] = "Please log in."
      redirect_to login_url
    end
  end
 
  protected
  def production?
    ENV["RAILS_ENV"] == "production"
  end
end
