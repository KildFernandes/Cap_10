Produção Total de uma Cultura por Estado e Safra

SELECT 
    estado, 
    tipo_cultura, 
    safra, 
    SUM(producao) AS producao_total
FROM 
    Cultura
WHERE 
    tipo_cultura = 'Soja' 
    AND safra = '2023'
GROUP BY 
    estado, tipo_cultura, safra
ORDER BY 
    producao_total DESC;


-------------------------------------------------
Evolução da Área Plantada de uma Cultura ao Longo dos Anos

SELECT 
    safra, 
    tipo_cultura, 
    SUM(area_plantada) AS area_total
FROM 
    Cultura
WHERE 
    tipo_cultura = 'Milho'
GROUP BY 
    safra, tipo_cultura
ORDER BY 
    safra;


-------------------------------------------------

Ranking dos Estados com Maior Produtividade em uma Cultura Específica

SELECT 
    estado, 
    tipo_cultura, 
    AVG(produtividade) AS media_produtividade
FROM 
    Cultura
WHERE 
    tipo_cultura = 'Trigo'
GROUP BY 
    estado, tipo_cultura
ORDER BY 
    media_produtividade DESC;


-------------------------------------------------
Relatório de Métodos de Controle e Produtos Recomendados

SELECT 
    mc.metodo AS metodo_controle, 
    p.nome_produto, 
    mc.dose_recomendada, 
    mc.periodo_ideal
FROM 
    metodo_controle mc
JOIN 
    metodo_controle_produto mcp ON mc.id = mcp.metodo_controle_id
JOIN 
    Produto p ON mcp.produto_id = p.id
ORDER BY 
    mc.metodo;


-------------------------------------------------

Análise de Pragas e Clima Favorável

SELECT 
    p.nome AS praga, 
    c.descricao AS clima_favoravel, 
    COUNT(pc.cultura_id) AS culturas_afetadas
FROM 
    Praga p
JOIN 
    Clima c ON p.clima_id = c.id
JOIN 
    praga_cultura pc ON p.id = pc.praga_id
GROUP BY 
    p.nome, c.descricao
ORDER BY 
    culturas_afetadas DESC;
