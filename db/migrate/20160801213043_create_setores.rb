class CreateSetores < ActiveRecord::Migration[5.0]
  def change
    create_table :setores do |t|
      t.string :nome
      t.string :sigla

      t.timestamps
    end
  end
end
