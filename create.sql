-- Criação de SEQUENCES para auto incremento
CREATE SEQUENCE seq_clima START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_praga START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_cultura START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_produto START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_metodo_controle START WITH 1 INCREMENT BY 1;

-- ---
-- Table 'Clima'
-- ---

DROP TABLE Clima CASCADE CONSTRAINTS;

CREATE TABLE Clima (
  id NUMBER PRIMARY KEY,
  descricao VARCHAR2(100) NOT NULL
);

-- Trigger para auto incremento
CREATE OR REPLACE TRIGGER trg_clima
BEFORE INSERT ON Clima
FOR EACH ROW
BEGIN
  :new.id := seq_clima.NEXTVAL;
END;
/

-- ---
-- Table 'Praga'
-- ---

DROP TABLE Praga CASCADE CONSTRAINTS;

CREATE TABLE Praga (
  id NUMBER PRIMARY KEY,
  nome VARCHAR2(100) NOT NULL,
  estagio VARCHAR2(50),
  nivel_infestacao VARCHAR2(50),
  clima_id NUMBER,
  FOREIGN KEY (clima_id) REFERENCES Clima(id)
);

CREATE OR REPLACE TRIGGER trg_praga
BEFORE INSERT ON Praga
FOR EACH ROW
BEGIN
  :new.id := seq_praga.NEXTVAL;
END;
/

-- ---
-- Table 'Cultura'
-- ---

DROP TABLE Cultura CASCADE CONSTRAINTS;

CREATE TABLE Cultura (
  id NUMBER PRIMARY KEY,
  tipo_cultura VARCHAR2(100) NOT NULL,
  estadio_fenologico VARCHAR2(100),
  safra VARCHAR2(10),
  estado VARCHAR2(50),
  area_plantada NUMBER,
  producao NUMBER,
  produtividade NUMBER(10, 2)
);

CREATE OR REPLACE TRIGGER trg_cultura
BEFORE INSERT ON Cultura
FOR EACH ROW
BEGIN
  :new.id := seq_cultura.NEXTVAL;
END;
/

-- ---
-- Table 'Produto'
-- ---

DROP TABLE Produto CASCADE CONSTRAINTS;

CREATE TABLE Produto (
  id NUMBER PRIMARY KEY,
  nome_produto VARCHAR2(100) NOT NULL,
  fabricante VARCHAR2(100),
  tipo VARCHAR2(50)
);

CREATE OR REPLACE TRIGGER trg_produto
BEFORE INSERT ON Produto
FOR EACH ROW
BEGIN
  :new.id := seq_produto.NEXTVAL;
END;
/

-- ---
-- Table 'Metodo_Controle'
-- ---

DROP TABLE Metodo_Controle CASCADE CONSTRAINTS;

CREATE TABLE Metodo_Controle (
  id NUMBER PRIMARY KEY,
  metodo VARCHAR2(100) NOT NULL,
  produto_recomendado VARCHAR2(100),
  dose_recomendada VARCHAR2(50),
  metodo_alternativo VARCHAR2(100),
  periodo_ideal VARCHAR2(100),
  praga_id NUMBER,
  FOREIGN KEY (praga_id) REFERENCES Praga(id)
);

CREATE OR REPLACE TRIGGER trg_metodo_controle
BEFORE INSERT ON Metodo_Controle
FOR EACH ROW
BEGIN
  :new.id := seq_metodo_controle.NEXTVAL;
END;
/

-- ---
-- Table 'Praga_Cultura'
-- ---

DROP TABLE Praga_Cultura CASCADE CONSTRAINTS;

CREATE TABLE Praga_Cultura (
  praga_id NUMBER,
  cultura_id NUMBER,
  PRIMARY KEY (praga_id, cultura_id),
  FOREIGN KEY (praga_id) REFERENCES Praga(id),
  FOREIGN KEY (cultura_id) REFERENCES Cultura(id)
);

-- ---
-- Table 'Metodo_Controle_Produto'
-- ---

DROP TABLE Metodo_Controle_Produto CASCADE CONSTRAINTS;

CREATE TABLE Metodo_Controle_Produto (
  metodo_controle_id NUMBER,
  produto_id NUMBER,
  PRIMARY KEY (metodo_controle_id, produto_id),
  FOREIGN KEY (metodo_controle_id) REFERENCES Metodo_Controle(id),
  FOREIGN KEY (produto_id) REFERENCES Produto(id)
);
