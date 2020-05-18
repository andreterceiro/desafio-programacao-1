class ComprasController < ApplicationController
  before_action 'verificar_logado', 'index'
	
  def index
    #evitando duplicação de registros
    if (session['contadores_processados'].is_a?(Array)) and ((not session['contadores_processados'].include?(params['contador'].to_i)))
      unless params['compras'].nil?
		if Compra.validar_nome(params['compras'].tempfile.path) == false
		  @mensagem = "Exensão inválida. Envie um arquivo com a extensão 'tab'"
		else
		  resultado = Compra.parsear params['compras'].tempfile.path
			
		  unless resultado == true
	       @mensagem = resultado
		  else
			@mensagem = "Arquivo processado com sucesso"
			
			unless (session['contadores_processados']).is_a? Array
			  session['contadores_processados'] = Array.new
			  session['contadores_processados'][0] = 0
			else
			  session['contadores_processados'].push(params['contador'].to_i)
			end			
	      end
		end	
	  end
    end
    
    @registros = Compra.all
    @mostrar_menu = true
    
    if session['contadores_processados'].nil?
      session['contadores_processados'] = Array.new
      session['contadores_processados'].push(0)
	end	
    @contador = session['contadores_processados'].last.to_i + 1
  end   
end
