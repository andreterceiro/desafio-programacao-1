class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
      
  def verificar_logado
    ! session.has_key? 'login' and session['login'] != nil
  end  
end
