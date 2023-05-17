# README

Esta é uma aplicação para processo seletivo Jedis.

## Requisitos

### Introdução (Backend)

Iremos fazer uma grande atualização e mudanças no nosso código. Por isso, é imprescindível que você saiba Ruby e Rails. Algumas apps nossas são legadas, monolíticas, mesmo no backend você irá precisar lidar com um pouco com frontend (mas fica tranquilo, te ajudamos nisso).

Tempo é fundamental para nós, porém, vamos focar na qualidade do seu trabalho, por isso, leve o tempo que achar necessário.

#### Desafio

- Crie um CRUD de municipes (Exceto deletar).
- O munícipe tem status ativo e inativo.
- Idealmente, só precisa ser 2 páginas: Listagem de CRUD (com opções para navegar), e o cadastro em si. 2 páginas é apenas uma sugestão, você é livre para montar o UI/UX da forma que achar melhor.

  **1** - Ter uma entidade relacionada chamada Munícipe. Essa entidade cadastrar cidadãos (pessoas) dentro de um município. As seguintes regras devem ser seguidas:

  **1.1** - Dados do munícipe: `Nome completo, CPF, CNS(cartão nacional de saúde), Email, Data nascimento, Telefone (código do país e ddd), Foto e status`.

  **1.2** - Todos os dados do munícipe são obrigatórios;

  **1.3** - `CPF, CNS,Email` devem ser válidos;

  **1.4** - Tenha atenção a data de nascimento. Valide os casos impossíveis/improváveis de serem válidos;

  **1.5** - Foto do munícipe deve ser tamanhos diferentes para servir vários casos.

  **2** - Ter uma entidade relacionada chamada Endereço. Essa entidade salva o endereço relacionado ao munícipe. As seguintes regras devem ser seguidas:

  **2.1** - Campos: `CEP, Logradouro, complemento, bairro, cidade, UF e código IBGE`;

  **2.2** - Todos os dados são obrigatórios, exceto complemento e código IBGE;

  **2.3** - Em termos de MVC, existe apenas a Entidade relacional endereço. O restante é dispensável;

## Stack da Aplicação

- Ruby 3.1.2
- Rails 7.0.4
- PostgreSQL 15
- Docker
- Gitflow

## Setup da Aplicação

Ao acessar a raiz da pasta, seguir os passos:

`$ docker-compose build`

`$ docker-compose run web bundle install`

`$ docker-compose run web rails db:create`

`$ docker-compose run web rails db:migrate`

`$ docker-compose up`

[Acessar App]([https://localhost:3000](https://localhost:3000)) - [https://localhost:3000](https://localhost:3000)

### Compilando Assets

`$ docker-compose run web rails assets:precompile`

## Notificações

### E-mail

Ao criar ou alterar um Municipe, uma notificação via e-mail é enviada.

Acesse o link abaixo para visualizar e-mails enviados.

[http://localhost:3000/letter_opener](http://localhost:3000/letter_opener)

#### SMS

Ao criar ou alterar um Municipe, uma notificação via SMS é enviada.

## Ambientes

[Desenvolvimento]([https://jedisapp.fly.dev/](https://jedisapp.fly.dev/)) - [https://jedisapp.fly.dev/](https://jedisapp.fly.dev/)

[QA]([https://jedisapp.fly.dev/](https://jedisapp.fly.dev/)) - [https://jedisapp.fly.dev/](https://jedisapp.fly.dev/)

[Produção]([https://jedisapp.fly.dev/](https://jedisapp.fly.dev/)) - [https://jedisapp.fly.dev/](https://jedisapp.fly.dev/)

obs: em um cenário ideal, cada ambiente seria diferente, por motivos de ser apenas um teste, a aplicação está em um ambiente de desenvolvimento.

## Testes

Gems Utilizadas:

- RSpec
- Rubocop
- Fakker
- FactoryBot
- Simplecov

### Executando Testes

#### Suíte completa

`$ docker-compose run web rspec`

ou

`$ docker-compose run web bundle exec rspec`

#### Testando Controller

- `$`

#### Testando Model

- `$`

#### Testando API

- `$`

#### Relatório de Cobertura de Testes (Simplecov)

- `$`

#### Testes do Rubocop

- `$ docker-compose run web rubocop`

#### Correção Automática via Rubocop

- `$ docker-compose run web rubocop -A`
