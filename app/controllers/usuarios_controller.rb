class UsuariosController < ApplicationController
  def logar
    @mostrar_menu = false
    
    unless params.has_key? :senha
	  puts "aqui"
	  @erro = false
	  @usuario = Usuario.new
    else
      resultado_login = Usuario.verificar_login(params)
	  if resultado_login
	    session['login'] = params['login']
	    redirect_to "/upload"
	  else
	  	@erro = true
	  end
    end
  end
    
  def logout
	session['login'] = nil  
    redirect_to "/"  
  end
    
  private
    #Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:login, :senha)
    end
end
