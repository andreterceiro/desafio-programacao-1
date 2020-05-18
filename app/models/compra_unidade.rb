class CompraUnidade < ActiveRecord::Base  
  belongs_to :compra
  
    
  def self.obter_soma compra_id
    itens_compra = CompraUnidade.where('compra_id=?', compra_id);
 
    total = 0
    itens_compra.each{|item_compra| 
      total = total + (item_compra.item_price * item_compra.purchase_count)
    }
    
    total  
  end
  
end
