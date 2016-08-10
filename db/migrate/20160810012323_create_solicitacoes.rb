class CreateSolicitacoes < ActiveRecord::Migration[5.0]
  def change
    create_table :solicitacoes do |t|
      t.references :usuario, foreign_key: true
      t.references :produto, foreign_key: true
      t.integer :quantidade_solicitada
      t.integer :quantidade_fornecida
      t.timestamp :data_fornecimento

      t.timestamps
    end
  end
end
