class Compra < ActiveRecord::Base  
  has_many :compraUnidade
  
  def self.validar_nome nome
     nome[-4..-1] === ".tab"
  end
  
  def self.parsear caminho_arquivo
    begin 
      Compra.transaction do
        itens = []
        arquivo = File.open(caminho_arquivo, "r")
        arquivo.each_line {|linha| 
          itens.push(linha.split("\t"))
        }

        compra = Compra.new
        compra.arquivo = caminho_arquivo
        compra.save

        ja_processou_cabecalho = false
        itens.each { |linha|    
          if linha.count != 6        
	        raise RuntimeError.new("O número de colunas de uma linha está errado. O arquivo não foi inserido")
          end
          
          unless ja_processou_cabecalho
            ja_processou_cabecalho = true
            next
		  end
            
          compra_unidade = CompraUnidade.new
          compra_unidade.compra_id = Compra.last.id
          compra_unidade.purchaser_name = linha[0]
          compra_unidade.item_description = linha[1]
          compra_unidade.item_price = linha[2].to_f
          compra_unidade.purchase_count = linha[3].to_i
          compra_unidade.merchant_address = linha[4]
          compra_unidade.merchant_name = linha[5][0..-2]      
          compra_unidade.save
        }   
       
        true
      end
    rescue RuntimeError => ex
      ActiveRecord::Rollback 
      return ex.message
    end
  end
end
