class Setor < ApplicationRecord

  validates :nome, :sigla, uniqueness: true, presence: true

  before_destroy :tem_mais_de_um?, :valid?

  # validate :deve_ter_um_principal

  def tem_mais_de_um?
    tem_mais_de_um = Setor.all.count > 1
    unless tem_mais_de_um
      errors.add :base,  "Deve sempre existir pelo menos um Setor."
    end
  end


  def nome=(nome)
    write_attribute :nome, nome.to_s.titleize
  end
  def sigla=(sigla)
    write_attribute :sigla, sigla.to_s[0,3].upcase
  end
end
