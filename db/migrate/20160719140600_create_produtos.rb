class CreateProdutos < ActiveRecord::Migration[5.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.float :valor_compra
      t.integer :quantidade
      t.text :descricao
      t.string :imagem

      t.timestamps
    end
  end
end
