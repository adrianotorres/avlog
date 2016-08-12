json.array!(@aquisicoes) do |aquisicao|
  json.extract! aquisicao, :id, :produto_id, :setor_id, :usuario_id, :quantidade
  json.url aquisicao_url(aquisicao, format: :json)
end
