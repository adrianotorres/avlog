json.array!(@produtos) do |produto|
  json.extract! produto, :id, :nome, :valor_compra, :quantidade, :descricao, :imagem
  json.url produto_url(produto, format: :json)
end
