class Estoque < ApplicationRecord
  belongs_to :produto
  belongs_to :setor

  validates :setor, :produto, :quantidade,  presence: true
  validates :setor, uniqueness: { scope: :produto }
  validates :quantidade, :numericality => { greater_than: 0 }

  scope :por_produto, -> (produto) { where(produto: produto) }
  scope :por_setor, -> (setor) { where(setor: setor) }

  def adquirir(quantidade)
    self.quantidade+=quantidade
  end
end
