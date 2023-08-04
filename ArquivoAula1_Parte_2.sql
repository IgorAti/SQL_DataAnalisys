#--- AULA 1 - INTENSIVÃO DE SQL ---#
#---   PRIMEIROS PASSOS NO SQL ---#

-- RESOLVENDO UM CASE REAL

# 1. SOBRE A TABELA RESULTADOS DO BD EMPRESAS

-- Você trabalha em uma empresa de consultoria, e faz parte da equipe que foi contratada para fazer um ESTUDO DE MERCADO para levantar as informações das principais empresas do mercado, dos mais variados setores.

-- A tabela RESULTADOS possui informações de diferentes empresas, como:
	# nome da empresa
    # setor
    # número de funcionários
    # receita e lucro
    # dentre outras informações

-- Você acabou de ser encarregado de trabalhar com o banco de dados EMPRESAS e utilizar o SQL para resolver alguns desafios relacionados ao projeto acima.




-- 1. É o seu primeiro dia como analista no projeto e você precisa visualizar as informações das empresas. Mas o que dão pra você é um banco de dados no MySQL e o famoso: SE VIRA! Selecione TODAS AS COLUNAS da tabela RESULTADOS do banco EMPRESAS.

-- selecionar todas as colunas da tabela resultados em banco de dados empresas

select * from empresas.resultados;









-- 2. Seu gerente achou que tinha muita informação pensando na demanda que ele queria naquele momento. Por isso, ele te pediu para alterar essa consulta ao banco de dados para mostrar apenas a coluna de nome das empresas.
-- Resolva esse desafio.

# selecionar apenas a coluna nome da tabela resultados do banco de dados empresas

SELECT 
    nome
FROM
    empresas.resultados;

-- 3. O setor de RH precisa fazer uma análise das empresas, e pediu a você que selecione APENAS as colunas id_empresa, nome, setor e num_funcionarios. Como resolver isso?

/* Selecionar todo o banco de dados para visualizar as colunas de forma clara
e realiza nova seleção com as colunas solicitadas */

select * from empresas.resultados;
select 
	id_empresa,
	nome, 
    setor, 
    num_funcionarios 
from empresas.resultados;


-- 4. O setor Financeiro precisa fazer uma análise das empresas, e pediu a você que selecione APENAS as colunas id_empresa, nome, setor e receitas. Obs: Dê um novo nome para cada coluna da query resultante.

select * from empresas.resultados;
select
	id_empresa as 'Id Empresa',
    nome as 'Nome Empresa',
    setor as 'Setor Empresa',
    receitas as 'Receita Total'
from 
	empresas.resultados;

-- 5. Sua empresa está fazendo um estudo de mercado e precisa saber quais empresas atuam em cada um desses dois setores: Tecnologia e Energia. Você consegue descobrir qual dos dois setores possui mais players?

select * from empresas.resultados;
select count(setor)
	nome,
    setor
from empresas.resultados
group by setor
having setor in ("Energia", "Tecnologia")
order by nome desc;
select count(id_empresa)
	nome,
    setor
from empresas.resultados
group by setor
order by nome desc;



