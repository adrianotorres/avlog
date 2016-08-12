class Aquisicao < ApplicationRecord
  belongs_to :produto
  belongs_to :setor
  belongs_to :usuario

  validates :setor, :usuario, :produto, :quantidade,  presence: true
  validates :quantidade, :numericality => { greater_than: 0 }

  before_create :cria_atualiza_estoque

  private

  def cria_atualiza_estoque
    estoques = Estoque.por_produto(self.produto).por_setor(self.setor)

    if estoques.any?
      estoque = estoques.first
      estoque.adquirir self.quantidade
      estoque.save
    else
      Estoque.create produto: self.produto, setor: self.setor, quantidade: self.quantidade
    end
  end
end
