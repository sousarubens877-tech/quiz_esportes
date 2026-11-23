import 'package:quiz_esportes/quiz_esportes.dart';
import 'package:test/test.dart';

void main() {
  group('normalizarResposta', () {
    test('aceita letras maiúsculas e minúsculas', () {
      expect(normalizarResposta('a'), 'A');
      expect(normalizarResposta('B'), 'B');
      expect(normalizarResposta('d'), 'D');
    });

    test('ignora espaços em volta', () {
      expect(normalizarResposta('  c  '), 'C');
    });

    test('rejeita Enter vazio e respostas inválidas', () {
      expect(normalizarResposta(''), isNull);
      expect(normalizarResposta('   '), isNull);
      expect(normalizarResposta('E'), isNull);
      expect(normalizarResposta('AB'), isNull);
      expect(normalizarResposta('1'), isNull);
      expect(normalizarResposta(null), isNull);
    });
  });

  group('banco de perguntas', () {
    test('cada nível tem pelo menos 5 perguntas', () {
      for (final nivel in niveis) {
        expect(nivel.perguntas.length, greaterThanOrEqualTo(5),
            reason: nivel.nome);
      }
    });

    test('cada pergunta tem 4 alternativas e um gabarito válido', () {
      for (final nivel in niveis) {
        for (final p in nivel.perguntas) {
          expect(p.alternativas.length, 4, reason: p.enunciado);
          expect(letras.contains(p.correta), isTrue, reason: p.enunciado);
        }
      }
    });
  });

  test('estaCorreta identifica acerto e erro', () {
    final p = perguntasFaceis.first; // vôlei: 6 jogadores (B)
    expect(estaCorreta(p, 'B'), isTrue);
    expect(estaCorreta(p, 'A'), isFalse);
    expect(p.textoCorreto, '6 jogadores');
  });

  test('porcentagem calcula corretamente', () {
    expect(porcentagem(4, 5), 80);
    expect(porcentagem(0, 5), 0);
    expect(porcentagem(5, 5), 100);
  });

  test('mensagem final varia conforme o desempenho', () {
    expect(mensagemDesempenho('Ana', 5, 5), contains('OURO'));
    expect(mensagemDesempenho('Ana', 4, 5), contains('PRATA'));
    expect(mensagemDesempenho('Ana', 2, 5), contains('BRONZE'));
    expect(mensagemDesempenho('Ana', 1, 5), contains('Não foi dessa vez'));
  });

  test('ranking ordena do melhor para o pior', () {
    final ranking = ordenarRanking(const [
      Resultado('Ana', 'Fácil', 3, 5),
      Resultado('Bia', 'Fácil', 5, 5),
      Resultado('Caio', 'Desafio total', 12, 15),
    ]);
    expect(ranking.map((r) => r.nome).toList(), ['Bia', 'Caio', 'Ana']);
  });
}
