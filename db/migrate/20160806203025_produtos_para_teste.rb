class ProdutosParaTeste < ActiveRecord::Migration[5.0]
  def change
    Produto.create nome: "Seringa 1ml", valor_compra: 2.9, descricao: "Seringa de 1ml: escalas de 0,1 ml, 2 U, 1 U", imagem: "seringa-1ml.jpg"
    Produto.create nome: "Seringa 3ml", valor_compra: 2.9, descricao: "Seringas de 3 ml: escalas de 0,1 ml", imagem: "seringa-3ml.jpg"
    Produto.create nome: "Seringa 5ml", valor_compra: 2.9, descricao: "Seringas de 5 ml: escalas de 0,2 ml", imagem: "seringa-5ml.jpg"
    Produto.create nome: "Seringa 10ml", valor_compra: 2.9, descricao: "Seringas de 10 ml: escalas de 0,2 ml", imagem: "seringa-10ml.jpg"
    Produto.create nome: "Seringa 20ml", valor_compra: 2.9, descricao: "Seringas de 20 ml: escala de 1 ml", imagem: "seringa-20ml.jpg"
  end
end
