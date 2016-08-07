json.array!(@produtos) do |produto|
  json.extract! produto, :id, :nome, :valor_compra, :descricao, :imagem
  json.url produto_url(produto, format: :json)
end
