json.array!(@setores) do |setor|
  json.extract! setor, :id, :nome, :sigla
  json.url setor_url(setor, format: :json)
end
