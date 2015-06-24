class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :set_admin
  #total hack to toggle admin menu in views/application.html.erb 
  def set_admin
    if params[:admin] != nil
      session[:admin] = params[:admin] 
    end
  end
  
end
