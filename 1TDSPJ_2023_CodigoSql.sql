
CREATE TABLE tbl_usuarios_tpm(
    cpf_usuario INTEGER NOT NULL,
    nome VARCHAR(200) NOT NULL,
    data_nascimento DATE NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INTEGER NOT NULL,
    complemento VARCHAR(30),
    bairro VARCHAR(30) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    email VARCHAR(20) NOT NULL,
    senha VARCHAR(15) NOT NULL
);
ALTER TABLE tbl_usuarios_tpm ADD CONSTRAINT tbl_usuarios_tpm_PK PRIMARY KEY (cpf_usuario);

SELECT * FROM tbl_usuarios_tpm;

COMMENT ON TABLE tbl_usuarios_tpm              IS 'Tabela de usuarios';

TRUNCATE TABLE tbl_usuarios_tpm;






CREATE TABLE tbl_telefones_tpm(
    id_telefone INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    telefone VARCHAR(9) NOT NULL,
    descricao VARCHAR(20) NOT NULL,
    cpf_usuario INTEGER
);
ALTER TABLE tbl_telefones_tpm ADD CONSTRAINT tbl_telefones_tpm_PK PRIMARY KEY (id_telefone);
ALTER TABLE tbl_telefones_tpm ADD CONSTRAINT tbl_telefones_tpm_tbl_usuarios_tpm_FK FOREIGN KEY (cpf_usuario)REFERENCES tbl_usuarios_tpm(cpf_usuario);

SELECT * FROM tbl_telefones_tpm;

COMMENT ON TABLE tbl_telefones_tpm              IS 'Tabela de Telefones';

TRUNCATE TABLE tbl_telefones_tpm;






CREATE TABLE tbl_bicicleta_tpm(
    num_serie INTEGER NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    cor VARCHAR(15) NOT NULL,
    tamanho VARCHAR(20) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    valor NUMBER(10,2) NOT NULL,
    nota_fiscal INTEGER NOT NULL,
    ano DATE NOT NULL,
    cpf_usuario INTEGER
);
ALTER TABLE tbl_bicicleta_tpm ADD CONSTRAINT tbl_bicicleta_tpm_PK PRIMARY KEY (num_serie);
ALTER TABLE tbl_bicicleta_tpm ADD CONSTRAINT tbl_bicicleta_tpm_tbl_usuarios_tpm_FK FOREIGN KEY (cpf_usuario)
REFERENCES tbl_usuarios_tpm(cpf_usuario);

SELECT * FROM tbl_bicicleta_tpm;

COMMENT ON TABLE tbl_bicicleta_tpm              IS 'Tabela cadastro de Bicicleta';

TRUNCATE TABLE tbl_bicicleta_tpm;






DROP TABLE IF EXISTS tbl_modificacoes_tpm;
CREATE TABLE tbl_modificacoes_tpm(
    id_modif INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    tipo_peca VARCHAR(50),
    descricao_peca VARCHAR(80),
    historico_manutencao VARCHAR(50),
    condicoes_peca VARCHAR(80),
    valor_modificacao NUMBER(10,2),
    num_serie INTEGER
);
ALTER TABLE tbl_modificacoes_tpm ADD CONSTRAINT tbl_modificacoes_tpm_PK PRIMARY KEY (id_modif);
ALTER TABLE tbl_modificacoes_tpm ADD CONSTRAINT tbl_modificacoes_tpm_tbl_bicicleta_tpm_FK FOREIGN KEY (num_serie)
REFERENCES tbl_bicicleta_tpm(num_serie);

SELECT * FROM tbl_modificacoes_tpm;

COMMENT ON TABLE tbl_modificacoes_tpm              IS 'Tabela de cadastro de Modificações';

TRUNCATE TABLE tbl_modificacoes_tpm;





DROP TABLE IF EXISTS tbl_sinistros_tpm;
CREATE TABLE tbl_sinistros_tpm(
    id_sinistro INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    data_prejuizo DATE,
    descricao_prejuizo VARCHAR(50),
    valor_prejuizo NUMBER(10,2),
    num_serie INTEGER
);
ALTER TABLE tbl_sinistros_tpm ADD CONSTRAINT tbl_sinistros_tpm_PK PRIMARY KEY (id_sinistro);
ALTER TABLE tbl_sinistros_tpm ADD CONSTRAINT tbl_sinistros_tpm_tbl_bicicleta_tpm_FK FOREIGN KEY (num_serie)
REFERENCES tbl_bicicleta_tpm(num_serie);

SELECT * FROM tbl_sinistros_tpm;

COMMENT ON TABLE tbl_sinistros_tpm              IS 'Tabela de cadastro de acidentes';

TRUNCATE TABLE tbl_sinistros_tpm;





DROP TABLE IF EXISTS tbl_apolice_tpm;
CREATE TABLE tbl_apolice_tpm(
    id_apolice INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    titular VARCHAR(40) NOT NULL,
    data_emissao DATE NOT NULL,
    tipo_cobertura VARCHAR(30) NOT NULL,
    valor_cobertura NUMERIC(10,2) NOT NULL,
    data_vencimento DATE NOT NULL,
    num_serie INTEGER
);
ALTER TABLE tbl_apolice_tpm ADD CONSTRAINT tbl_apolice_tpm_PK PRIMARY KEY (id_apolice);
ALTER TABLE tbl_apolice_tpm ADD CONSTRAINT tbl_apolice_tpm_tbl_bicicleta_tpm_FK FOREIGN KEY (num_serie)
REFERENCES tbl_bicicleta_tpm(num_serie);

SELECT * FROM tbl_apolice_tpm;

COMMENT ON TABLE tbl_apolice_tpm              IS 'Tabela de apolice';

TRUNCATE TABLE tbl_apolice_tpm;





DROP TABLE IF EXISTS tbl_fotos_tpm;
CREATE TABLE tbl_fotos_tpm(
    policy INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    foto_num_serie BLOB NOT NULL,
    data_foto_bike DATE NOT NULL,
    foto_modificacao BLOB,
    foto_sinistro BLOB,
    foto_contratante BLOB NOT NULL,
    id_apolice INTEGER NOT NULL
);
ALTER TABLE tbl_fotos_tpm ADD CONSTRAINT tbl_fotos_tpm_PK PRIMARY KEY (policy);
ALTER TABLE tbl_fotos_tpm ADD CONSTRAINT tbl_fotos_tpm_tbl_apolice_tpm_FK FOREIGN KEY (id_apolice)
REFERENCES tbl_apolice_tpm(id_apolice);

SELECT * FROM tbl_fotos_tpm;

COMMENT ON TABLE tbl_fotos_tpm              IS 'Tabela de fotos';


TRUNCATE TABLE tbl_fotos_tpm;






DROP TABLE tbl_usuarios_tpm;
DROP TABLE tbl_telefones_tpm;
DROP TABLE tbl_bicicleta_tpm;
DROP TABLE tbl_modificacoes_tpm;
DROP TABLE tbl_sinistros_tpm;
DROP TABLE tbl_apolice_tpm;
DROP TABLE tbl_fotos_tpm;



