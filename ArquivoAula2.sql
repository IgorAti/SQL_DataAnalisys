# --- AULA 2: COMANDOS ESSENCIAIS DO SQL --- #

# 1. APRESENTAÇÃO
-- A hashtagmovie é um banco de dados que tem como principal objetivo armazenar as informações de desempenho dos filmes alugados pelo serviço de streaming da empresa ao longo do período. 

-- Esse banco de dados é composto por 5 tabelas:
	# alugueis: armazena os dados relacionados aos aluguéis dos filmes
    # atores: armazena os dados dos atores dos diferentes filmes
    # atuacoes: tabela contendo a participação de cada ator no respectivo filme
    # clientes: tabela com os dados dos clientes da empresa
    # filmes: dados sobre os filmes disponíveis para aluguel


-- Esses dados serão fundamentais para que futuramente sejam feitas análises dos dados para tomadas de decisão de curto e longo prazo, como:

-- i) Decisão de investir em determinados filmes baseado na sua popularidade (nota)
-- ii) Número total de locações definirá a RECEITA DA EMPRESA
-- iii) A média de avaliação dos filmes definirá a SATISFAÇÃO DOS CLIENTES
-- iv) O número de clientes ativos definirá o ENGAJAMENTO DOS CLIENTES

-- O projeto então terá alguns objetivos, como:	
		-- Descobrir as preferências dos clientes de acordo com região e sexo
		-- Popularidade dos filmes por gênero e ano de lançamento
        -- Filmes com nota acima da média
        -- Dentre outros
        
-- Para que a gente seja capaz de realizar todas essas análises no SQL (aula 3), precisaremos aprender os COMANDOS ESSENCIAIS, que serão mostrados na aula de hoje (e continuaremos na aula 3).



# =======        PARTE 1:       =======#
# =======  COMANDOS DE SELEÇÃO  =======#


-- SELECT, SELECT LIMIT, SELECT DISTINCT 

-- 1. Você foi alocado como analista responsável da hashtagmovie. 
-- Seu primeiro desafio é fazer um reconhecimento das tabelas do banco de dados, isso será importante para as próximas etapas do projeto.
-- Além disso, identifique a quantidade de linhas que existem para cada tabela. Esse check será importante para garantir que nenhuma informação está faltando.

select * from hashtagmovie.alugueis;
select count(id_aluguel)
from hashtagmovie.alugueis;

select * from hashtagmovie.atores;
select count(id_ator)
from hashtagmovie.atores;

select * from hashtagmovie.atuacoes;
select count(id_protagonista)
from hashtagmovie.atuacoes;


select * from hashtagmovie.clientes;
select count(id_cliente) 
from hashtagmovie.clientes;


select * from hashtagmovie.filmes;
select count(id_filme)
from hashtagmovie.filmes;

-- 2. Pensando que as tabelas do SQL podem ter milhões de linhas, para fazer o reconhecimento de tabelas nem sempre é necessário visualizar todas as linhas, basta verificar as N primeiras linhas. 

-- Por isso, uma boa prática para selecionar os dados no SQL é limitar a quantidade de linhas que são visualizadas na tabela. 
-- a) Utilize o comando LIMIT para visualizar apenas as 10 primeiras linhas da tabela de FILMES.

select * from hashtagmovie.filmes
limit 10;


-- b) Utilize o comando LIMIT para visualizar apenas as 50 primeiras linhas da tabela de CLIENTES.

select * from hashtagmovie.clientes
limit 50;
-- no SQL Server é usado top no lugar do limit 

-- 3. O responsável pela criação das tabelas disse que os filmes se dividem em um total de 7 GÊNEROS: 1) Comédia; 2) Drama; 3) Ficção e Fantasia; 4) Mistério e Suspense; 5) Arte; 6) Animação; 7) Ação e Aventura.

-- Nesse momento, você terá o IMPORTANTE trabalho de verificar se todos esses gêneros estão de fato presentes na tabela FILMES. Caso não esteja, você deverá reportar ao responsável.

select distinct genero from hashtagmovie.filmes;

select 
	count(distinct genero)
from hashtagmovie.filmes;

-- 4. A empresa sabe que precisa expandir seu mercado para o máximo de estados possível. Como analista dos dados, você deverá identificar quais são os estados onde atualmente a empresa possui clientes. Quantos são esses estados no total? Pensando que o país tem 27 UF (26 estados + DF), ainda há espaço para expandir para quantos estados?

select * from hashtagmovie.clientes;
select count(distinct estado) 
from hashtagmovie.clientes;
-- Possibilidade de expandir para 16 estados
# Possibilidade de expandir para 16 estados




# =======         PARTE 2:        =======#
# =======  COMANDOS DE ORDENAÇÃO  =======#

-- ORDER BY ASC, ORDER BY DESC

-- 1. Faça uma análise em cima do ano de nascimento de cada um dos atores. Ordene a tabela de atores para mostrar os atores com os anos de nascimento do maior para o menor.

select * from hashtagmovie.atores
order by ano_nascimento desc;

select * from hashtagmovie.atores
order by ano_nascimento asc;

select * from hashtagmovie.atores
order by ano_nascimento;

-- 2. O setor de controle de dados vai precisar fazer uma segmentação dos clientes, separando por ordem alfabética. Faça uma ordenação na tabela de clientes a partir da coluna nome_cliente para facilitar o trabalho dos seus colegas.

select * from hashtagmovie.clientes
order by nome_cliente;



-- 3. Na tabela de clientes, tente descobrir qual foi o cliente com a data de criação de conta mais antiga, ou seja, o primeiro cliente cadastrado na base.

select * from hashtagmovie.clientes
order by data_criacao_conta
limit	1;

-- 4. A empresa gostaria de saber quais são os TOP 5 filmes com a maior duração. Você seria capaz de fazer essa análise?

SELECT * FROM hashtagmovie.filmes
ORDER BY duracao DESC
LIMIT 5;

# =======         PARTE 3:        =======#
# =======  COMANDOS DE FILTRAGEM  =======#

-- WHERE (padrão, AND/OR, IN, BETWEEN)

# Parei no vídeo aula em 01:15:32

-- 1. A empresa deseja incluir em seu catálogo mais filmes do gênero de COMÉDIA. Para isso, ela deverá adquirir os direitos de transmissão junto ao estúdio responsável.

-- Porém, a empresa deve tomar cuidado para não negociar um filme que já existe em seu catálogo.

-- O seu trabalho, portanto, é listar todos os filmes do gênero COMÉDIA e fornecer essas informações ao seu gestor.

select * from hashtagmovie.filmes
where genero = "Comédia";

select count(id_filme) from hashtagmovie.filmes
where genero = "Comédia";

-- 2. A equipe de estratégia fez um levantamento com os críticos de cinema mais conhecidos e descobriram que o ano de 2003 foi um dos anos de sucesso do cinema. Alguns desses críticos foram contratados para ajudar na melhoria do catálogo de filmes, e querem sugerir mais opções de filmes que foram lançados em 2003.

-- Para isso, os críticos contratados precisarão da lista de filmes que a empresa já tem, para que eles possam avaliar se esses filmes realmente são boas opções de se ter no catálogo, e também aproveitar para sugerir outros títulos.

-- O seu trabalho, portanto, é fazer uma consulta ao banco de dados para essa solicitação do projeto. 

select * from hashtagmovie.filmes
where ano_lancamento = 2003;

-- 3. Um dos analistas da equipe percebeu que alguns filmes do gênero Drama, com mais de 120 minutos de duração, não tinham uma boa avaliação dos clientes. Por isso, ele levantou a ideia de se analisar com mais cuidado todos os filmes que se enquadrassem nesses critérios, para verificar se de fato eles estão tendo um baixo rendimento.

-- O seu trabalho é listar todos esses filmes para que seja possível realizar essa análise.

select * from hashtagmovie.filmes
where genero = "Drama" and duracao >= 120
order by duracao desc;

-- 4. A empresa está percebendo que os países do: Canadá, Austrália e Irlanda do Norte estão produzindo bons filmes nos últimos anos. Vendo esse movimento, a empresa decidiu listar todos os atores dessas nacionalidades para pesquisar filmes relacionados e avaliar a possibilidade de incluir mais opções no catálogo, referentes ao cinema desses 3 países.

-- O seu trabalho é listar todos os atores de nacionalidade: Canadá, Austrália e Irlanda do Norte para facilitar essa análise.

select * from hashtagmovie.atores
where nacionalidade in ("Canadá", "Austrália", "Irlanda do Norte");

select * from hashtagmovie.atores
where nacionalidade in("Canadá", "Austrália", "Irlanda do Norte") and sexo = "feminino";



-- 5. A empresa decidiu criar uma opção de catálogo alternativa para os seus filmes: agora, os clientes poderão escolher, por exemplo, alugar filmes na faixa de duração entre 90 min e 100 minutos. Seu trabalho será o de iniciar essa organização, e começar mostrando os filmes que possuem uma duração neste intervalo.

select * from hashtagmovie.filmes
where duracao between 90 and 100
order by duracao asc, titulo desc;

# =======        PARTE 4:       =======#
# =======  FUNÇÕES MATEMÁTICAS  =======#

-- Funções de Agregação: COUNT, COUNT DISTINCT, SUM, MIN, MAX, AVG

-- 1. A tabela de ALUGUEIS tem o registro de todos os aluguéis feitos no serviço de streaming da empresa.

-- a) Descubra a quantidade total de alugueis de filmes feitos para todo o período (utilize a coluna id_aluguel para esse cálculo).

select * from hashtagmovie.alugueis;
select count(id_aluguel)
from hashtagmovie.alugueis;
# 578 aluguéis

-- b) Descubra a quantidade total de alugueis de filmes feitos para todo o período (utilize a coluna nota para esse cálculo).

select count(nota) 
from hashtagmovie.alugueis;
# 328 aluguéis com nota



-- c) Você viu alguma diferença no resultado? O que aconteceu?

select * from hashtagmovie.alugueis;
select count(id_aluguel) - count(nota)
from hashtagmovie.alugueis;

# Existem 250 aluguéis sem nota

-- 2. O setor de catálogo precisa saber quantos gêneros de filmes existem na empresa atualmente. Você saberia fazer essa análise?

select * from hashtagmovie.filmes;
select count(distinct genero)
from hashtagmovie.filmes;

# são 7 gêneros distintos

-- PAREI EM 01:51:07
-- 3. Quantos minutos no total a empresa possui de filmes catalogados?
select * from hashtagmovie.filmes;
select sum(duracao) as 'Total Minutos'
from hashtagmovie.filmes;
# a empresa possui 8592 minutas de filmes catalogados

-- 4. Qual é a duração em minutos do filme mais longo disponível no catálogo? E qual a duração do filme mais curto?
select * from hashtagmovie.filmes;
select * 
from hashtagmovie.filmes
order by duracao desc;

select *
from hashtagmovie.filmes
order by duracao asc;

select 
	max(duracao)
from hashtagmovie.filmes;
# a duração do filme mais longo disponível em catálogo é de 200 minutos

select
	min(duracao)
from hashtagmovie.filmes;
# a duração do filme mais curto disponível em catálogo é de 91 minutos

select 
	min(duracao) as 'Menor Duração',
	max(duracao) as 'Maior Duração'
from hashtagmovie.filmes;

-- 5. Qual é a média de satisfação dos clientes da empresa em relação aos filmes alugados?
select * from hashtagmovie.alugueis;
select round(avg(nota),4) 
from hashtagmovie.alugueis;
# a média de satisfação do cliente é de 7,94 ou 7,939, dependendo da quantidade de casas decimais

select 
	data_aluguel,
    round(avg(nota),2)
from hashtagmovie.alugueis
group by data_aluguel
order by data_aluguel desc;

select * from hashtagmovie.alugueis
order by data_aluguel desc;