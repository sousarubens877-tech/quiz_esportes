import 'pergunta.dart';

/// Perguntas do nível Fácil.
const List<Pergunta> perguntasFaceis = [
  Pergunta(
    enunciado: 'Quantos jogadores cada equipe tem em quadra no vôlei?',
    alternativas: ['5 jogadores', '6 jogadores', '7 jogadores', '11 jogadores'],
    correta: 'B',
  ),
  Pergunta(
    enunciado: 'Em qual esporte existe a "cesta de três pontos"?',
    alternativas: ['Handebol', 'Basquete', 'Futsal', 'Vôlei'],
    correta: 'B',
  ),
  Pergunta(
    enunciado: 'Quantos jogadores cada equipe tem em campo no futebol?',
    alternativas: ['9', '10', '11', '12'],
    correta: 'C',
  ),
  Pergunta(
    enunciado: 'Qual cidade sediou os Jogos Olímpicos de 2016?',
    alternativas: ['Londres', 'Tóquio', 'Pequim', 'Rio de Janeiro'],
    correta: 'D',
  ),
  Pergunta(
    enunciado: 'Em qual esporte o atleta usa uma prancha para deslizar nas ondas?',
    alternativas: ['Surfe', 'Remo', 'Vela', 'Canoagem'],
    correta: 'A',
  ),
];

/// Perguntas do nível Médio.
const List<Pergunta> perguntasMedias = [
  Pergunta(
    enunciado: 'Quantos sets uma equipe precisa vencer para ganhar '
        'uma partida de vôlei de quadra?',
    alternativas: ['2', '3', '4', '5'],
    correta: 'B',
  ),
  Pergunta(
    enunciado: 'Quantos jogadores cada equipe tem em quadra no futsal, '
        'contando o goleiro?',
    alternativas: ['4', '6', '5', '7'],
    correta: 'C',
  ),
  Pergunta(
    enunciado: 'Qual é a distância oficial de uma maratona?',
    alternativas: ['21,1 km', '40 km', '50 km', '42,195 km'],
    correta: 'D',
  ),
  Pergunta(
    enunciado: 'Qual nadador é o maior medalhista olímpico da história?',
    alternativas: ['Michael Phelps', 'Mark Spitz', 'Ryan Lochte', 'César Cielo'],
    correta: 'A',
  ),
  Pergunta(
    enunciado: 'Na capoeira, qual instrumento comanda a roda?',
    alternativas: ['Atabaque', 'Pandeiro', 'Berimbau', 'Agogô'],
    correta: 'C',
  ),
];

/// Perguntas do nível Difícil.
const List<Pergunta> perguntasDificeis = [
  Pergunta(
    enunciado: 'Em que ano o Brasil conquistou sua primeira Copa do Mundo '
        'de futebol masculino?',
    alternativas: ['1950', '1958', '1962', '1970'],
    correta: 'B',
  ),
  Pergunta(
    enunciado: 'No vôlei, qual jogador usa camisa de cor diferente e só '
        'pode atuar no fundo da quadra?',
    alternativas: ['Levantador', 'Oposto', 'Ponteiro', 'Líbero'],
    correta: 'D',
  ),
  Pergunta(
    enunciado: 'Até quantos pontos é disputado o tie-break (5º set) no vôlei?',
    alternativas: ['15 pontos', '21 pontos', '25 pontos', '11 pontos'],
    correta: 'A',
  ),
  Pergunta(
    enunciado: 'Em qual cidade foram realizados os primeiros Jogos Olímpicos '
        'da Era Moderna, em 1896?',
    alternativas: ['Paris', 'Atenas', 'Londres', 'Roma'],
    correta: 'B',
  ),
  Pergunta(
    enunciado: 'Qual é a altura oficial da rede no vôlei masculino adulto?',
    alternativas: ['2,24 m', '2,35 m', '2,43 m', '2,50 m'],
    correta: 'C',
  ),
];

/// Níveis disponíveis no jogo. O "Desafio total" junta todas as perguntas.
final List<Nivel> niveis = [
  const Nivel('Fácil', perguntasFaceis),
  const Nivel('Médio', perguntasMedias),
  const Nivel('Difícil', perguntasDificeis),
  Nivel('Desafio total', [
    ...perguntasFaceis,
    ...perguntasMedias,
    ...perguntasDificeis,
  ]),
];
