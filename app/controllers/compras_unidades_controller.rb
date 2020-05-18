class ComprasUnidadesController < ApplicationController
  before_action 'verificar_logado', 'index'
	
  def index
    @registros = CompraUnidade.where("compra_id=?", params['id'])
    
    @soma = CompraUnidade.obter_soma(@registros.last.compra_id)
    @mostrar_menu = true
  end  
end
