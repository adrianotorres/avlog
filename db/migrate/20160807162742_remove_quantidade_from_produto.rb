class RemoveQuantidadeFromProduto < ActiveRecord::Migration[5.0]
  def change
    remove_column :produtos, :quantidade
  end
end
