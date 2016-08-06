class Produto < ApplicationRecord
  validates :nome, uniqueness: true
  validates :valor_compra, :imagem, :nome,  presence: true
end
