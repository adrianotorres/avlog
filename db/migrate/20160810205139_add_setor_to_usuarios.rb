class AddSetorToUsuarios < ActiveRecord::Migration[5.0]
  def change
    add_reference :usuarios, :setor, foreign_key: true
  end
end
