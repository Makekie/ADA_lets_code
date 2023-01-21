create  database modulo_5_divTech;

create schema campeonato;

create table campeonato.jogos (
	 id_jogo integer primary key GENERATED ALWAYS AS IDENTITY,
	 time1 integer  not null,
	 time2 integer check (time2 != time1) not null,
	 golstime1 integer check (golstime1 >= 0) not null,
	 golstime2 integer check (golstime1 >= 0) not null,
	 dia_jogo date not null,
	 local_jogo integer not null
);

create table campeonato.jogadores (
	 codigo_jogador integer primary key GENERATED ALWAYS AS IDENTITY,
	 nome varchar(255) not null,
	 idade integer not null,
	 codigo_time integer not null
);

create table campeonato.times (
	 codigo_time integer primary key GENERATED ALWAYS AS IDENTITY,
	 nome_time varchar(255) not null,
	 codigo_cidade integer not null
);

create table campeonato.jogo_jogadores (
	 gols integer check(gols >= 0) not null,
	 codigo_jogador integer not null,
	 codigo_jogo integer not null
);

create table campeonato.cidade (
	 codigo_cidade integer primary key GENERATED ALWAYS AS IDENTITY,
	 nome_cidade varchar(255) not null,
	 codigo_estado integer not null
);

create table campeonato.estado (
	 codigo_estado integer primary key GENERATED ALWAYS AS IDENTITY,
	 nome_estado varchar(60) not null unique,
	 uf varchar(20) not null unique
);

alter table campeonato.cidade
	add foreign key (codigo_estado) references campeonato.estado(codigo_estado);

alter table campeonato.times
	add foreign key (codigo_cidade) references campeonato.cidade(codigo_cidade);
	
alter table campeonato.jogadores
	add foreign key (codigo_time) references campeonato.times(codigo_time);
	
alter table campeonato.jogos
	add foreign key (time1) references campeonato.times(codigo_time),
	add foreign key (time2) references campeonato.times(codigo_time),
	add foreign key (local_jogo) references campeonato.cidade(codigo_cidade);
	
alter table campeonato.jogo_jogadores
	add foreign key (codigo_jogador) references campeonato.jogadores(codigo_jogador),
	add foreign key (codigo_jogo) references campeonato.jogos(id_jogo);