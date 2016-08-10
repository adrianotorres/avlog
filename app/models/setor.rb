class Setor < ApplicationRecord

  validates :nome, :sigla, uniqueness: true, presence: true

  has_many :estoques

  def nome=(nome)
    write_attribute :nome, nome.to_s.titleize
    self.nome.strip!
  end
  def sigla=(sigla)
    write_attribute :sigla, sigla.to_s[0,3].upcase
  end


  scope :principal, -> { where(principal: true).first }
end
