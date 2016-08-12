class Produto < ApplicationRecord
  validates :nome, uniqueness: true
  validates :valor_compra, :imagem, :nome,  presence: true

  has_many :estoques
end
