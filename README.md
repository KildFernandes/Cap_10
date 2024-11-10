# 🌾 Projeto de Modelagem de Banco de Dados Agrícola

## 📋 **Descrição do Projeto**
Este projeto visa aplicar conceitos de modelagem de dados para criar um banco de dados relacional voltado para armazenar e analisar informações sobre a produção agrícola no Brasil. Utilizando dados de órgãos como **CONAB**, **IBGE**, **Embrapa**, e **MAPA**, o projeto foca em armazenar informações sobre pragas, culturas agrícolas, métodos de controle, produtos utilizados e condições climáticas favoráveis.

## 📑 Conteúdo dos Arquivos
1. Diretório img
- Este diretório contém as imagens dos diagramas criados durante a modelagem do banco de dados:
- datamodeler.png: Captura de tela do diagrama criado no Oracle Data Modeler.
- diagrama MER.png: Diagrama Entidade-Relacionamento (MER) do projeto.
- diagrama entidade relacionamento.png: Diagrama de Entidade-Relacionamento (DER) utilizado para o modelo lógico.

2. Arquivo consultas.sql
- Este arquivo contém as consultas SQL criadas para analisar os dados do banco de dados. Algumas das consultas incluem:
- Produção total de uma determinada cultura por estado em uma safra.
- Evolução da área plantada de uma cultura ao longo dos anos.
- Ranking dos estados com maior produtividade em uma cultura específica.

3. Arquivo create.sql
- O arquivo create.sql contém o script para criação das tabelas do banco de dados. As tabelas foram projetadas para armazenar informações sobre:
- Pragas (praga)
- Culturas (cultura)
- Métodos de Controle (metodo_controle)
- Produtos (produto)
- Relacionamentos entre pragas e culturas (praga_cultura)

4. Arquivo dicionario.ods
- O arquivo dicionario.ods é o dicionário de dados do projeto, contendo a descrição de cada tabela e seus atributos, incluindo tipos de dados, restrições (PK, FK) e explicações sobre o uso de cada campo.

5. Arquivo ER.xml
- O ER.xml é o arquivo exportado do SQLDesigner contendo o Diagrama Entidade-Relacionamento (DER). Ele pode ser importado novamente na ferramenta para ajustes ou visualização.

## 📂 **Estrutura do Repositório**

```bash
📦 projeto-modelagem-agricola
├── 📁 img
│   ├── datamodeler.png              # Captura de tela do diagrama criado no Oracle Data Modeler
│   ├── diagrama MER.png             # Imagem do Diagrama Entidade-Relacionamento (MER)
│   └── diagrama entidade relacionamento.png # Imagem do Diagrama de Entidade-Relacionamento (DER)
├── 📝 consultas.sql                 # Arquivo contendo consultas SQL para análise dos dados
├── 📝 create.sql                    # Script SQL para criação das tabelas do banco de dados
├── 📝 dicionario.ods                # Dicionário de dados em formato ODS (LibreOffice/Excel)
├── 📝 ER.xml                        # Arquivo XML do Diagrama Entidade-Relacionamento (exportado do SQLDesigner)
└── 📝 README.md                     # Documentação do projeto