json.array!(@solicitacoes) do |solicitacao|
  json.extract! solicitacao, :id, :usuario_id, :produto_id, :quantidade_solicitada, :quantidade_fornecida
  json.url solicitacao_url(solicitacao, format: :json)
end
