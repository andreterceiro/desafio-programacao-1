class UploadsController < ApplicationController
  before_action 'verificar_logado', 'index'

  def index
    @mostrar_menu = true
    
    unless params.has_key? :senha
     @erro = false
  	    @usuario = Usuario.new
	  else
		resultado_login = Usuario.verificar_login(params)
		if resultado_login
		else
		  @erro = true  
		end
	  end    
    
  end  
end
