SELECT estado, SUM(producao)
FROM producao
WHERE cultura = 'Soja' AND safra = '2023'
GROUP BY estado;

-------------------------------------------------

SELECT ano, SUM(area_plantada)
FROM producao
WHERE cultura = 'Milho'
GROUP BY ano
ORDER BY ano;

-------------------------------------------------

SELECT estado, AVG(produtividade) AS media_produtividade
FROM producao
WHERE cultura = 'Trigo'
GROUP BY estado
ORDER BY media_produtividade DESC;
