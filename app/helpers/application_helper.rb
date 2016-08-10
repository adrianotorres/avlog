module ApplicationHelper
  def usuario_do_setor_principal
    current_usuario.setor.id == Setor.principal.id
  end
end
