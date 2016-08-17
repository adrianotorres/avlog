module EstoquesHelper
  def class_estoque(quantidade)
    case
    when quantidade < 3
      'danger'
    when (3..10) === quantidade
      'warning'
    when (11..20) === quantidade
      'primary'
    when quantidade > 30
      'success'
    end
  end
end
