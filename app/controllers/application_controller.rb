class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  before_action :authenticate_usuario!


  def after_sign_in_path_for(resource_or_scope)
    setores_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_usuario_session_path
  end
end
