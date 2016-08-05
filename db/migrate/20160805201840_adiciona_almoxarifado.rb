class AdicionaAlmoxarifado < ActiveRecord::Migration[5.0]
  def change
    Setor.create nome: 'Almoxarifado', sigla: 'AMX', principal: true
  end
end
