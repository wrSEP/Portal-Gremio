-- Portal Grêmio - estrutura do banco de dados (MySQL 8+)
-- Baseado no diagrama ER do projeto acadêmico.
-- Os nomes das tabelas/colunas e relacionamentos seguem o diagrama.
-- Tamanhos de TEXT/CHAR/INT seguem tipos mostrados; AUTO_INCREMENT,
-- nulabilidade e regras de referência são escolhas de implementação.
-- Senhas: armazenar somente hashes seguros, nunca texto puro.

CREATE DATABASE IF NOT EXISTS portal_gremio
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE portal_gremio;

CREATE TABLE IF NOT EXISTS tblusuario (
    id_usu INT AUTO_INCREMENT PRIMARY KEY,
    Usu_RM INT,
    Usu_nome TEXT,
    Usu_telefone CHAR(11),
    Usu_emailETEC TEXT,
    Usu_senhaETEC TEXT,
    Usu_numAcesso INT
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS tblimagenspost (
    id_ima INT AUTO_INCREMENT PRIMARY KEY,
    Img_caminhoImg TEXT
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS tblpublicacao (
    id_pla INT AUTO_INCREMENT PRIMARY KEY,
    Pub_idUsuario INT,
    Pub_titulo TEXT,
    Pub_sobTitulo TEXT,
    Pub_idImagem1 INT,
    Pub_idImagem2 INT,
    Pub_descricao TEXT,
    Pub_dataAnuncio DATE,
    Pub_horaAnuncio TIME,

    CONSTRAINT fk_publicacao_usuario
      FOREIGN KEY (Pub_idUsuario) REFERENCES tblusuario(id_usu),
    CONSTRAINT fk_publicacao_imagem1
      FOREIGN KEY (Pub_idImagem1) REFERENCES tblimagenspost(id_ima),
    CONSTRAINT fk_publicacao_imagem2
      FOREIGN KEY (Pub_idImagem2) REFERENCES tblimagenspost(id_ima)
) ENGINE=InnoDB;

-- Conferência:
-- SHOW TABLES;
-- SHOW CREATE TABLE tblpublicacao;
