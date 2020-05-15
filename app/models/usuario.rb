class Usuario < ActiveRecord::Base
  def self.verificar_login params 
     Usuario.where(login: params[:login], senha: params[:senha]).count >= 1
  end
end
