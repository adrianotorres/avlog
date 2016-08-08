# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...




Requisitos


*** Cadastrar empresa, filiais (como organização do lten)

usuario
  * Customizar as view (intenacionalizar)
  * Adicionar setor no cadastro de usuário.
  * Adicionar admin (boolean)
  * Só admin podem cadastrar usuários


aquisição (entrada do produto)
  * Será sempre para o setor principal
  * Validar se o usuário pertence ao setor principal, caso contrário, lançar um erro

fornecimento(solicitação do produto) (saída do produto)
  * verificar se serão em dois passos, 1-Solicitação, 2-Fornecimento
  * tela de solicitação de produtos



Estoque de produto por setor
cada setor visualizar a quantidade do produto em todos setores, podendo solicitar diretamente em ambos (com conhecimento do almoxarifado)
solicitação emergência (empréstimo)


*clicar na imagem, ver a disponibilidade para solicitar empréstimo (ñ informar a quantidade, apenas se disponível)
informar a qtd necessária, o setor solicitado irá emprestar a qtd desejada por ele.

*informar disponibilidade da imagem com verde, amarelo e vermelho

Relatório diário
- Planejado
- Executado


Usuários
Administrador
Almoxarifado (cadastra os produtos | fornece produtos solicitados pelos setores | acompanha empréstimos entre setores)
Setor


*IGF
