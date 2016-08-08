class Estoque < ApplicationRecord
  belongs_to :produto
  belongs_to :setor

  validates :setor, :produto, :quantidade,  presence: true
  validates :setor, uniqueness: { scope: :produto }
end
