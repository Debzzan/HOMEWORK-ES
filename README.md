# RottenPotatoes — Engenharia de Software

Catálogo de filmes desenvolvido para as atividades de Engenharia de Software. Permite cadastrar, listar, visualizar, editar e excluir filmes, além de ordenar a listagem por título ou data de lançamento.

## Tecnologias e pré-requisitos

- Ruby **3.4.10**, conforme `.ruby-version`.
- Rails **8.1.4**, conforme `Gemfile.lock`; instalado com as dependências.
- Bundler para instalar as gems.
- SQLite para o banco de dados local.
- Haml nas páginas e Minitest nos testes automatizados.
- Git para obter e versionar o projeto.

No Windows, use um ambiente Ruby/Rails no WSL, conforme o roteiro da disciplina. O editor pode ser VS Code ou RubyMine.

Confira as ferramentas no terminal:

```sh
ruby --version
bundle --version
git --version
sqlite3 --version
```

## Instalar as dependências

Para obter uma nova cópia do projeto:

```sh
git clone https://github.com/Debzzan/HOMEWORK-ES.git
cd HOMEWORK-ES
bundle install
```

Se você já tem o projeto, execute `bundle install` na pasta que contém o `Gemfile`. No ambiente usado durante a atividade, essa pasta se chama `rottenpotatoes`.

## Preparar o banco

Na raiz do projeto, execute:

```sh
bin/rails db:prepare
bin/rails db:seed
```

`db:prepare` prepara o banco de desenvolvimento e aplica as migrations necessárias. `db:seed` garante a existência do filme **The Godfather**, cadastrado em `db/seeds.rb`.

Os seeds procuram esse filme pelo título antes de criar um registro, permitindo repetir o comando sem duplicá-lo. Eles não atualizam os atributos de um filme já encontrado.

Os arquivos SQLite ficam em `storage/`, com bancos separados para desenvolvimento e testes.

## Iniciar a aplicação

```sh
bin/rails server
```

Abra [http://localhost:3000/movies](http://localhost:3000/movies). A listagem está em `/movies`; a raiz `/` mantém a página inicial do Rails.

Mantenha o terminal do servidor aberto. Para executar outros comandos, use outro terminal na raiz do projeto. Para encerrar o servidor, pressione `Ctrl + C`.

## Executar os testes

Para executar a suíte completa:

```sh
bin/rails test
```

Para executar apenas os testes do model:

```sh
bin/rails test test/models/movie_test.rb
```

Os testes verificam as validações do model e as ações do controller. Uma execução bem-sucedida termina com `0 failures` e `0 errors`.

## Regras e ordenação

- Título e data de lançamento são obrigatórios.
- A classificação indicativa deve ser `G`, `PG`, `PG-13`, `R` ou `NC-17`.
- A descrição é opcional.
- Os cabeçalhos **Título** e **Lançamento** permitem ordenar a tabela.
- Somente `title` e `release_date` são aceitos como critérios de ordenação. Outros valores são ignorados.

Exemplos de endereços:

```text
/movies?sort=title
/movies?sort=release_date
```

A ordenação por título usa a comparação padrão do SQLite, que distingue maiúsculas de minúsculas. A ordenação por lançamento é crescente, da data mais antiga para a mais recente.

## Estrutura principal

| Caminho | Responsabilidade |
| --- | --- |
| `app/models/movie.rb` | Model e validações dos filmes |
| `app/controllers/movies_controller.rb` | Ações do CRUD e consulta ordenada |
| `app/views/movies/` | Listagem, detalhes e formulários em Haml |
| `app/views/layouts/application.html.haml` | Layout compartilhado e mensagens flash |
| `app/assets/stylesheets/application.css` | Estilos das páginas |
| `config/routes.rb` | Rotas da aplicação |
| `db/migrate/` | Alterações da estrutura do banco |
| `db/seeds.rb` | Dados iniciais |
| `test/` | Testes automatizados e fixtures |

## Conferência manual

1. Abra a listagem e cadastre um filme com título, classificação e data válidos.
2. Atualize a página e confirme que o registro permanece.
3. Tente cadastrar um filme sem título ou data e confira as mensagens de validação.
4. Edite um filme e confirme que a alteração foi salva.
5. Ordene a lista pelos dois cabeçalhos.
6. Exclua o filme de teste e confirme que ele desapareceu da listagem.

## Versionamento

Antes de cada commit, revise o diff e os arquivos selecionados. Credenciais, `config/master.key`, arquivos `.env` com segredos e bancos locais devem permanecer fora do repositório, conforme o `.gitignore`.

Para contribuir, crie uma branch a partir da `main` atualizada, faça uma alteração relacionada a uma issue e abra um pull request. Após a revisão e o merge no GitHub, atualize sua `main` local com `git pull`.
