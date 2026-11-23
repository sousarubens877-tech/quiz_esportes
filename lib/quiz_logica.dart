import 'pergunta.dart';

/// Converte o que o jogador digitou em 'A', 'B', 'C' ou 'D'.
/// Aceita maiúsculas ou minúsculas e ignora espaços.
/// Retorna null quando a resposta é vazia ou inválida.
String? normalizarResposta(String? entrada) {
  if (entrada == null) {
    return null;
  }
  final resposta = entrada.trim().toUpperCase();
  if (letras.contains(resposta)) {
    return resposta;
  }
  return null;
}

/// Verifica se a resposta (já normalizada) é a correta.
bool estaCorreta(Pergunta pergunta, String resposta) {
  return pergunta.correta == resposta;
}

/// Porcentagem inteira de acertos (ex.: 4 de 5 = 80).
int porcentagem(int acertos, int total) {
  if (total == 0) {
    return 0;
  }
  return acertos * 100 ~/ total;
}

/// Mensagem final que muda conforme o desempenho do jogador.
String mensagemDesempenho(String nome, int acertos, int total) {
  final pct = porcentagem(acertos, total);
  if (total > 0 && acertos == total) {
    return 'MEDALHA DE OURO, $nome! Você gabaritou o quiz. '
        'Desempenho de campeão olímpico!';
  } else if (pct >= 70) {
    return 'MEDALHA DE PRATA, $nome! Mandou muito bem, '
        'faltou pouco para o lugar mais alto do pódio.';
  } else if (pct >= 40) {
    return 'MEDALHA DE BRONZE, $nome! Bom jogo, '
        'mas dá para treinar mais um pouco.';
  } else {
    return 'Não foi dessa vez, $nome. Todo atleta começa no treino: '
        'jogue de novo e supere sua marca!';
  }
}

/// Resultado de uma partida, usado no ranking.
class Resultado {
  final String nome;
  final String nivel;
  final int acertos;
  final int total;

  const Resultado(this.nome, this.nivel, this.acertos, this.total);

  int get aproveitamento => porcentagem(acertos, total);
}

/// Devolve uma cópia do ranking ordenada do melhor para o pior:
/// primeiro pela porcentagem de acertos, depois pelo número de acertos.
List<Resultado> ordenarRanking(List<Resultado> resultados) {
  final ordenado = List<Resultado>.from(resultados);
  ordenado.sort((a, b) {
    final comparacao = b.aproveitamento.compareTo(a.aproveitamento);
    if (comparacao != 0) {
      return comparacao;
    }
    return b.acertos.compareTo(a.acertos);
  });
  return ordenado;
}
