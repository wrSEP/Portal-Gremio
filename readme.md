# 📰 Portal Grêmio — Sistema Web de Notícias e Gerenciamento de Publicações

## 📌 Sobre o Projeto

O **Portal Grêmio** é um projeto acadêmico de desenvolvimento web voltado à comunicação e à divulgação de informações no ambiente escolar.

O sistema foi desenvolvido para disponibilizar um ambiente digital de publicações e notícias, incluindo funcionalidades de cadastro de usuários, autenticação, gerenciamento de conteúdo e diferentes níveis de acesso.

Sua estrutura integra **PHP, JavaScript e MySQL**, permitindo a comunicação entre a interface web, as regras de negócio e o banco de dados relacional.

## 🎯 Objetivo do Sistema

O objetivo do Portal Grêmio é oferecer uma plataforma organizada para gerenciamento e divulgação de informações relacionadas ao ambiente escolar.

Entre as principais funcionalidades desenvolvidas estão:

- Cadastro e autenticação de usuários.
- Diferenciação de acesso entre integrantes do Grêmio e alunos.
- Gerenciamento de notícias e publicações.
- Associação de imagens às publicações.
- Consulta de informações armazenadas no banco de dados.
- Exclusão de publicações.
- Gerenciamento de sessões de usuários.

## 🛠️ Tecnologias Utilizadas

| Tecnologia | Aplicação |
|---|---|
| **PHP** | Desenvolvimento do back-end, autenticação e processamento de requisições. |
| **MySQL** | Armazenamento de usuários, publicações e imagens. |
| **SQL** | Consultas, inserções, exclusões e relacionamentos entre tabelas. |
| **JavaScript** | Validação de campos do formulário de login. |
| **HTML** | Estruturação das páginas. |
| **CSS** | Estilização da interface web. |
| **MySQLi** | Comunicação entre PHP e banco de dados. |

## 🔐 Autenticação e Níveis de Acesso

O Portal Grêmio possui um mecanismo de autenticação desenvolvido em PHP, integrado ao banco de dados MySQL.

O login é realizado por meio de e-mail e senha, com verificação das credenciais registradas.

O sistema utiliza o campo `Usu_numAcesso` para diferenciar os usuários e direcioná-los para áreas específicas.

**Níveis de acesso identificados:**

- **Grêmio (`Usu_numAcesso = 1`):** redirecionamento para a área do Grêmio.
- **Aluno (demais valores):** redirecionamento para a área do aluno.

Após a autenticação, o sistema utiliza sessões PHP para armazenar informações do usuário e manter seu estado de login.

A autenticação utiliza `password_verify()` para verificar as senhas armazenadas em formato de hash.

O encerramento da sessão é realizado pelo arquivo `logout.php`.

## 🗄️ Banco de Dados Relacional

O banco de dados do Portal Grêmio foi estruturado em MySQL, utilizando **três tabelas relacionadas entre si**.

A modelagem organiza as informações de usuários, publicações e imagens, permitindo consultar os conteúdos e identificar seus respectivos autores.

### Estrutura das tabelas

| Tabela | Finalidade |
|---|---|
| `tblUsuario` | Armazenamento de dados cadastrais, credenciais e níveis de acesso dos usuários. |
| `tblPublicacao` | Registro das notícias, incluindo títulos, descrições, datas, horários, autores e referências às imagens. |
| `tblImagensPost` | Armazenamento dos caminhos das imagens utilizadas nas publicações. |

### Relacionamentos

A tabela `tblPublicacao` possui três referências a registros de outras tabelas:

- `Pub_idUsuario` → `tblUsuario.id_usu`
- `Pub_idImagem1` → `tblImagensPost.id_ima`
- `Pub_idImagem2` → `tblImagensPost.id_ima`

Essa estrutura permite associar cada publicação a um usuário e a até duas imagens.

### Conhecimentos de SQL aplicados

- Criação e estruturação de tabelas relacionais.
- Definição de chaves primárias e estrangeiras.
- Relacionamentos entre entidades.
- Consultas utilizando `SELECT` e `LEFT JOIN`.
- Inserção de registros com `INSERT INTO`.
- Exclusão de registros com `DELETE`.
- Utilização de consultas parametrizadas.
- Controle de transações com `COMMIT` e `ROLLBACK`.

## ⚙️ Desenvolvimento Back-end

O back-end foi desenvolvido em PHP, utilizando classes e métodos para organizar operações relacionadas ao banco de dados.

### Gerenciamento de Usuários

A classe `Usuario` implementa funcionalidades de cadastro e consulta de usuários.

Entre os recursos utilizados estão:

- Recebimento de dados enviados por formulários.
- Inserção de usuários no banco de dados.
- Armazenamento de senhas utilizando `password_hash()`.
- Consultas por meio de MySQLi e prepared statements.

### Gerenciamento de Publicações

A classe `Publicacao` concentra operações relacionadas ao conteúdo publicado.

O código implementa:

- Consulta de publicações existentes.
- Recuperação das informações dos autores.
- Associação de imagens às publicações.
- Cadastro de notícias e conteúdos.
- Organização de dados de publicação, incluindo data e horário.

Para recuperar publicações e suas informações relacionadas, são utilizadas consultas SQL com `LEFT JOIN`.

### Gerenciamento de Imagens

O sistema possui funcionalidades para armazenar os caminhos das imagens no banco de dados.

Durante o cadastro de publicações, os arquivos enviados são processados pelo PHP, e seus caminhos podem ser associados aos registros das notícias.

### Exclusão de Publicações

A exclusão é realizada por meio de uma operação SQL parametrizada.

O processo verifica a existência da publicação e utiliza uma transação para controlar a operação, aplicando `COMMIT` quando a exclusão é concluída ou `ROLLBACK` em caso de falha identificada.

## 🔄 Fluxo de Funcionamento

```text
             PORTAL GRÊMIO
                   |
                   v
             Tela de Login
                   |
                   v
        Validação JavaScript
                   |
                   v
       Autenticação com PHP
                   |
                   v
          Consulta ao MySQL
                   |
                   v
       Verificação de Credenciais
                   |
                   v
          Nível de Acesso
             /          \
            /            \
           v              v
      Área Grêmio      Área Aluno
           |
           v
    Gerenciamento de
       Publicações
           |
           v
      Banco de Dados
```

## 📂 Estrutura do Repositório

Organização dos arquivos do projeto responsáveis por mim:

```text
Portal-Gremio/
│
├── README.md
│
├── config/
│   └── db.php
│
├── database/
│   └── create_tables_portal_gremio.sql
│
├── model/
│   ├── Usuario.php
│   ├── Publicacao.php
│   ├── ImagensPost.php
│   ├── testeLogin.php
│   └── Deletar.php
│
├── views/
│   ├── login.php
│   ├── verificacaoLogin.php
│   ├── logout.php
│   └── login.js
│
└── docs/
    └── diagrama.png
```

*Observação: a estrutura representa uma organização sugerida para o repositório. Outros diretórios e arquivos da aplicação podem ser adicionados conforme sua disponibilidade.*

## 💻 Requisitos para Execução

Para executar o sistema em ambiente local, são necessários:

- PHP com extensão MySQLi.
- Servidor web compatível com PHP, como Apache.
- MySQL.
- Navegador web.
- Configuração de conexão com o banco de dados.

O arquivo `database/create_tables.sql` contém a estrutura das tabelas e seus relacionamentos.

A execução completa da aplicação depende dos arquivos de interface, configuração e demais componentes utilizados no projeto.

## 🎯 Conhecimentos Aplicados

O desenvolvimento do Portal Grêmio proporcionou a aplicação prática de conhecimentos em:

- Desenvolvimento web com PHP e JavaScript.
- Programação orientada a objetos.
- Integração entre front-end, back-end e banco de dados.
- Modelagem e manipulação de dados relacionais.
- Operações CRUD, incluindo cadastro, consulta e exclusão.
- Autenticação e gerenciamento de sessões.
- Controle de acesso baseado em informações dos usuários.
- Consultas SQL utilizando múltiplas tabelas.
- Manipulação de arquivos e imagens com PHP.

## 👨‍💻 Desenvolvimento

**Wesley Rafael**

Projeto acadêmico desenvolvido durante a formação técnica em Desenvolvimento de Sistemas na ETEC.

Participação no desenvolvimento de funcionalidades web e integração com banco de dados, utilizando PHP, JavaScript e SQL.

**Áreas de interesse:** Python | SQL | Análise de Dados | Automação de Processos.