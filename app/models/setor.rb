class Setor < ApplicationRecord

  validates :nome, :sigla, uniqueness: true, presence: true

  before_destroy :tem_mais_de_um?, :valid?

  # validate :deve_ter_um_principal




  def nome=(nome)
    write_attribute :nome, nome.to_s.titleize
  end
  def sigla=(sigla)
    write_attribute :sigla, sigla.to_s[0,3].upcase
  end
end
