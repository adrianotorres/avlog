class AddPrincipalToSetores < ActiveRecord::Migration[5.0]
  def change
    add_column :setores, :principal, :boolean
  end
end
