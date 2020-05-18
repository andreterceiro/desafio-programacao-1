class Usuario < ActiveRecord::Base
  def self.verificar_login params
     salt = File.read("#{Rails.root}/config/salt.txt")

     params[:senha] = params[:senha] + salt
     
     Usuario.where(login: params[:login], senha: ::Digest::MD5.hexdigest(params[:senha])).count >= 1
  end
end
