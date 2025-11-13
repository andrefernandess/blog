# Blog (Projeto de Estudos — Ruby on Rails)

Projeto de estudos em Ruby on Rails preparado para desenvolvimento local, testes e deploy via contêiner/Docker.

## Tecnologias
- Ruby: ver [`.ruby-version`](.ruby-version)
- Rails: ver em [`Gemfile`](Gemfile)
- Banco de dados: PostgreSQL (configurado em [config/database.yml](config/database.yml))
- Servidor web: Puma (configuração em [config/puma.rb](config/puma.rb))
- Cache/Queue/Cable: gems [`solid_cache`](Gemfile), [`solid_queue`](Gemfile), [`solid_cable`](Gemfile)
- Assets: Propshaft + Importmap (veja [config/importmap.rb](config/importmap.rb) e [app/assets/stylesheets/application.css](app/assets/stylesheets/application.css))
- Container / Deploy: Dockerfile ([Dockerfile](Dockerfile)) e Kamal ([config/deploy.yml](config/deploy.yml), [.kamal/secrets](.kamal/secrets))
- CI: GitHub Actions ([.github/workflows/ci.yml](.github/workflows/ci.yml))

## Estrutura importante
- Código principal: [app/](app/)
- Configurações: [config/](config/)
- Scripts utilitários: [bin/](bin/) — por exemplo [`bin/setup`](bin/setup), [`bin/dev`](bin/dev), [`bin/rails`](bin/rails)
- Páginas estáticas de erro: [public/404.html](public/404.html), [public/422.html](public/422.html), [public/500.html](public/500.html)
- Layout principal: [app/views/layouts/application.html.erb](app/views/layouts/application.html.erb)
- Classe base do controller: [`ApplicationController`](app/controllers/application_controller.rb)

## Requisitos locais
- Ruby conforme [`.ruby-version`](.ruby-version)
- Bundler (vem com Ruby moderno) e PostgreSQL disponível localmente
- Node não é obrigatório (importmap usado)

## Como rodar localmente (desenvolvimento)
1. Instalar dependências:
   - bundle: `bundle install`
2. Preparar o banco:
   - `bin/rails db:prepare`
3. Executar servidor de desenvolvimento:
   - `bin/dev` (usa [`bin/rails`](bin/rails))
4. Acessar: http://localhost:3000

Alternativa com Docker (build de produção):
- Build e run (exemplo):
  - `docker build -t blog .`
  - `docker run -e RAILS_MASTER_KEY=<sua_master_key> -p 80:80 blog`

Veja instruções e entrypoint em [Dockerfile](Dockerfile) e [bin/docker-entrypoint](bin/docker-entrypoint).

## Variáveis de ambiente importantes
- RAILS_MASTER_KEY — necessário para tarefas que usam credenciais (veja [.kamal/secrets](.kamal/secrets))
- DATABASE_URL — se quiser apontar para DB remoto/local alternativo
- JOB_CONCURRENCY / SOLID_QUEUE_IN_PUMA — configuração de jobs (ver [config/queue.yml](config/queue.yml) e [config/puma.rb](config/puma.rb))

## Testes
- Testes unitários e funcionais: `bin/rails test`
- Testes de sistema: `bin/rails test:system`
- Comandos úteis: `bin/rails db:test:prepare`
- CI: definido em [.github/workflows/ci.yml](.github/workflows/ci.yml)

## Tarefas comuns
- Limpar logs/tmp: `bin/rails log:clear tmp:clear`
- Resetar banco de desenvolvimento: `bin/rails db:reset`
- Precompilar assets (produção): `SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile`

## Deploy
- Arquivo principal: [config/deploy.yml](config/deploy.yml)
- Hooks de deploy/instrumentação: [.kamal/hooks/](.kamal/hooks/)
- Processo recomendado: usar Kamal para construir e publicar a imagem definida em [Dockerfile](Dockerfile) e configurar segredos via [.kamal/secrets](.kamal/secrets)

## Observações
- Páginas de erro estáticas estão em [public/](public/) e podem ser personalizadas (ex.: [public/500.html](public/500.html)).
- Políticas de segurança (CSP) comentadas em [config/initializers/content_security_policy.rb](config/initializers/content_security_policy.rb).
- Para alterações no comportamento HTTP (SSL, hosts, healthcheck), ver [config/environments/production.rb](config/environments/production.rb).

Contribuições ou dúvidas: abra uma issue ou edite este README.

```// filepath: README.md
# Blog (Projeto de Estudos — Ruby on Rails)

Projeto de estudos em Ruby on Rails preparado para desenvolvimento local, testes e deploy via contêiner/Docker.

## Tecnologias
- Ruby: ver [`.ruby-version`](.ruby-version)
- Rails: ver em [`Gemfile`](Gemfile)
- Banco de dados: PostgreSQL (configurado em [config/database.yml](config/database.yml))
- Servidor web: Puma (configuração em [config/puma.rb](config/puma.rb))
- Cache/Queue/Cable: gems [`solid_cache`](Gemfile), [`solid_queue`](Gemfile), [`solid_cable`](Gemfile)
- Assets: Propshaft + Importmap (veja [config/importmap.rb](config/importmap.rb) e [app/assets/stylesheets/application.css](app/assets/stylesheets/application.css))
- Container / Deploy: Dockerfile ([Dockerfile](Dockerfile)) e Kamal ([config/deploy.yml](config/deploy.yml), [.kamal/secrets](.kamal/secrets))
- CI: GitHub Actions ([.github/workflows/ci.yml](.github/workflows/ci.yml))

## Estrutura importante
- Código principal: [app/](app/)
- Configurações: [config/](config/)
- Scripts utilitários: [bin/](bin/) — por exemplo [`bin/setup`](bin/setup), [`bin/dev`](bin/dev), [`bin/rails`](bin/rails)
- Páginas estáticas de erro: [public/404.html](public/404.html), [public/422.html](public/422.html), [public/500.html](public/500.html)
- Layout principal: [app/views/layouts/application.html.erb](app/views/layouts/application.html.erb)
- Classe base do controller: [`ApplicationController`](app/controllers/application_controller.rb)

## Requisitos locais
- Ruby conforme [`.ruby-version`](.ruby-version)
- Bundler (vem com Ruby moderno) e PostgreSQL disponível localmente
- Node não é obrigatório (importmap usado)

## Como rodar localmente (desenvolvimento)
1. Instalar dependências:
   - bundle: `bundle install`
2. Preparar o banco:
   - `bin/rails db:prepare`
3. Executar servidor de desenvolvimento:
   - `bin/dev` (usa [`bin/rails`](bin/rails))
4. Acessar: http://localhost:3000

Alternativa com Docker (build de produção):
- Build e run (exemplo):
  - `docker build -t blog .`
  - `docker run -e RAILS_MASTER_KEY=<sua_master_key> -p 80:80 blog`

Veja instruções e entrypoint em [Dockerfile](Dockerfile) e [bin/docker-entrypoint](bin/docker-entrypoint).

## Variáveis de ambiente importantes
- RAILS_MASTER_KEY — necessário para tarefas que usam credenciais (veja [.kamal/secrets](.kamal/secrets))
- DATABASE_URL — se quiser apontar para DB remoto/local alternativo
- JOB_CONCURRENCY / SOLID_QUEUE_IN_PUMA — configuração de jobs (ver [config/queue.yml](config/queue.yml) e [config/puma.rb](config/puma.rb))

## Testes
- Testes unitários e funcionais: `bin/rails test`
- Testes de sistema: `bin/rails test:system`
- Comandos úteis: `bin/rails db:test:prepare`
- CI: definido em [.github/workflows/ci.yml](.github/workflows/ci.yml)

## Tarefas comuns
- Limpar logs/tmp: `bin/rails log:clear tmp:clear`
- Resetar banco de desenvolvimento: `bin/rails db:reset`
- Precompilar assets (produção): `SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile`

## Deploy
- Arquivo principal: [config/deploy.yml](config/deploy.yml)
- Hooks de deploy/instrumentação: [.kamal/hooks/](.kamal/hooks/)
- Processo recomendado: usar Kamal para construir e publicar a imagem definida em [Dockerfile](Dockerfile) e configurar segredos via [.kamal/secrets](.kamal/secrets)

## Observações
- Páginas de erro estáticas estão em [public/](public/) e podem ser personalizadas (ex.: [public/500.html](public/500.html)).
- Políticas de segurança (CSP) comentadas em [config/initializers/content_security_policy.rb](config/initializers/content_security_policy.rb).
- Para alterações no comportamento HTTP (SSL, hosts, healthcheck), ver [config/environments/production.rb](config/environments/production.rb).

Contribuições ou dúvidas: abra uma issue ou edite este README.
