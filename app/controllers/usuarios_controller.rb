class UsuariosController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def logar
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
  private
    #Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:login, :senha)
    end
end
