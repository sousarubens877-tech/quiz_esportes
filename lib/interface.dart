import 'dart:io';

import 'banco_perguntas.dart';
import 'pergunta.dart';
import 'quiz_logica.dart';

const String linhaDupla = '==================================================';
const String linhaSimples = '--------------------------------------------------';

/// Lê uma linha do terminal com stdin.readLineSync().
/// Se a entrada for encerrada (Ctrl+D / Ctrl+Z), o jogo termina com educação.
String lerLinha() {
  final entrada = stdin.readLineSync();
  if (entrada == null) {
    print('');
    print('Entrada encerrada. Até a próxima!');
    exit(0);
  }
  return entrada;
}

void exibirBoasVindas() {
  print('');
  print(linhaDupla);
  print('              QUIZ DOS ESPORTES');
  print('        Aqueça os neurônios e entre em quadra!');
  print(linhaDupla);
  print('Bem-vindo(a)! Responda às perguntas digitando A, B, C ou D.');
  print('Cada acerto vale 1 ponto. Boa sorte!');
  print('');
}

/// Pergunta o nome do jogador até que ele digite algo.
String lerNome() {
  while (true) {
    stdout.write('Qual é o seu nome, atleta? ');
    final nome = lerLinha().trim();
    if (nome.isNotEmpty) {
      return nome;
    }
    print('O nome não pode ficar vazio. Tente novamente.');
  }
}

/// Lê um número inteiro entre [minimo] e [maximo], repetindo se for inválido.
int lerOpcao(String mensagem, int minimo, int maximo) {
  while (true) {
    stdout.write(mensagem);
    final numero = int.tryParse(lerLinha().trim());
    if (numero != null && numero >= minimo && numero <= maximo) {
      return numero;
    }
    print('Opção inválida! Digite um número de $minimo a $maximo.');
  }
}

/// Mostra os níveis e devolve o nível escolhido.
Nivel escolherNivel(String nome) {
  print('');
  print('$nome, escolha o nível de dificuldade:');
  for (var i = 0; i < niveis.length; i++) {
    print('  ${i + 1}) ${niveis[i].nome} '
        '(${niveis[i].perguntas.length} perguntas)');
  }
  final opcao = lerOpcao('Nível (1 a ${niveis.length}): ', 1, niveis.length);
  return niveis[opcao - 1];
}

void exibirPergunta(Pergunta pergunta, int numero, int total) {
  print('');
  print(linhaSimples);
  print('Pergunta $numero de $total');
  print(pergunta.enunciado);
  for (var i = 0; i < pergunta.alternativas.length; i++) {
    print('  ${letras[i]}) ${pergunta.alternativas[i]}');
  }
}

/// Lê a resposta e só aceita A, B, C ou D (maiúscula ou minúscula).
String lerResposta() {
  while (true) {
    stdout.write('Sua resposta: ');
    final resposta = normalizarResposta(lerLinha());
    if (resposta != null) {
      return resposta;
    }
    print('Resposta inválida! Digite apenas A, B, C ou D.');
  }
}

/// Joga uma partida completa e devolve o resultado.
Resultado jogarPartida(String nome, Nivel nivel) {
  // Copia a lista e embaralha a ordem das perguntas.
  final perguntas = List<Pergunta>.from(nivel.perguntas)..shuffle();
  var acertos = 0;

  print('');
  print('Nível ${nivel.nome}: valendo! Bora, $nome!');

  for (var i = 0; i < perguntas.length; i++) {
    final pergunta = perguntas[i];
    exibirPergunta(pergunta, i + 1, perguntas.length);
    final resposta = lerResposta();

    if (estaCorreta(pergunta, resposta)) {
      acertos++;
      print('Acertou, $nome! Ponto para você!');
    } else {
      print('Errou! A alternativa correta era '
          '${pergunta.correta}) ${pergunta.textoCorreto}.');
    }
  }

  final total = perguntas.length;
  print('');
  print(linhaDupla);
  print('FIM DE JOGO, $nome!');
  print('Você acertou $acertos de $total perguntas '
      '(${porcentagem(acertos, total)}%).');
  print(mensagemDesempenho(nome, acertos, total));
  print(linhaDupla);

  return Resultado(nome, nivel.nome, acertos, total);
}

void exibirRanking(List<Resultado> resultados) {
  final ranking = ordenarRanking(resultados);
  print('');
  print('RANKING DA SESSÃO');
  for (var i = 0; i < ranking.length; i++) {
    final r = ranking[i];
    print('  ${i + 1}º ${r.nome} - ${r.acertos}/${r.total} '
        '(${r.aproveitamento}%) - nível ${r.nivel}');
  }
}

/// Menu depois da partida: 1 = jogar novamente, 2 = trocar jogador, 3 = sair.
int menuFinal() {
  print('');
  print('O que deseja fazer agora?');
  print('  1) Jogar novamente');
  print('  2) Trocar de jogador');
  print('  3) Sair');
  return lerOpcao('Opção: ', 1, 3);
}
