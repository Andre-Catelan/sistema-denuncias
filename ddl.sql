CREATE TABLE CATEGORIA (
    id_categoria SERIAL PRIMARY KEY,
    nome_categoria VARCHAR(255),
    descricao_categoria TEXT
);

CREATE TABLE UNIDADE (
    id_unidade SERIAL PRIMARY KEY,
    nome_unidade VARCHAR(255),
    localizacao VARCHAR(255)
);

CREATE TABLE ATENDENTE (
    id_atendente SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    senha VARCHAR(255) -- Atributo de senha adicionado para autenticação
);

CREATE TABLE PAPEL_ACESSO (
    id_papel SERIAL PRIMARY KEY,
    nome_papel VARCHAR(255),
    descricao TEXT
);

CREATE TABLE DENUNCIA (
    id_denuncia SERIAL PRIMARY KEY,
    titulo VARCHAR(255),
    descricao TEXT,
    data_local DATE,
    protocolo VARCHAR(255),
    senha VARCHAR(255),
    status VARCHAR(100),
    
    id_categoria INT,
    id_unidade INT,
    
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria),
    FOREIGN KEY (id_unidade) REFERENCES UNIDADE(id_unidade)
);

CREATE TABLE ANEXO (
    id_anexo SERIAL PRIMARY KEY,
    descricao TEXT,
    path VARCHAR(255),
    
    id_denuncia INT,
    
    FOREIGN KEY (id_denuncia) REFERENCES DENUNCIA(id_denuncia)
);

CREATE TABLE MENSAGEM (
    id_mensagem SERIAL PRIMARY KEY,
    conteudo TEXT,
    data_envio DATE,
    remetente VARCHAR(100),
    
    id_denuncia INT,
    id_atendente INT NULL,
    
    FOREIGN KEY (id_denuncia) REFERENCES DENUNCIA(id_denuncia),
    FOREIGN KEY (id_atendente) REFERENCES ATENDENTE(id_atendente)
);

CREATE TABLE ATENDENTE_PAPEL (
    id_atendente INT,
    id_papel INT,
    
    PRIMARY KEY (id_atendente, id_papel),
    
    FOREIGN KEY (id_atendente) REFERENCES ATENDENTE(id_atendente),
    FOREIGN KEY (id_papel) REFERENCES PAPEL_ACESSO(id_papel)
);
