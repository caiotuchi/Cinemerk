--Cbter todos os filmes cujo nome seja 'Cruella'
SELECT FROM filme WHERE nome = 'Cruella';

--Consultar o nome e o gênero de todos os filmes da tabela filme, e ordenar pela ordem alfabética do nome e do gênero
SELECT nome, genero FROM filme ORDER BY nome, genero;

-- Unir as tabelas funcionario e funcionario_telefone e exibir o resultado
SELECT * FROM funcionario, funcionario_telefone WHERE funcionario.cpf = funcionario_telefone.cpf;

-- Unir as tabelas funcionario, funcionario_telefone e dependente e exibir o resultado
SELECT * FROM funcionario, funcionario_telefone, dependente WHERE funcionario.cpf = funcionario_telefone.cpf AND dependente.CPF_funcionario = funcionario.cpf;

-- Consultar quais são as classificações dos filmes da tabela filme
SELECT classificacao FROM filme GROUP BY classificacao;

--Consultar quais são todas as opções de classificações indicativas para maiores de 10 anos dos filmes cadastrados no cinema
SELECT classificacao, count(*) FROM filme GROUP BY classificacao HAVING classificacao > 10;

-- Unir as tabelas funcionario e funcionario_telefone, exibindo todos os funcionarios, mesmo que não tenham telefone
SELECT * FROM funcionario LEFT JOIN funcionario_telefone ON funcionario.cpf = funcionario_telefone.cpf;