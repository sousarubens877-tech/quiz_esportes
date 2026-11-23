/// Letras das alternativas, na ordem em que aparecem na tela.
const List<String> letras = ['A', 'B', 'C', 'D'];

/// Representa uma pergunta do quiz com quatro alternativas.
class Pergunta {
  final String enunciado;
  final List<String> alternativas;

  /// Letra da alternativa correta: 'A', 'B', 'C' ou 'D'.
  final String correta;

  const Pergunta({
    required this.enunciado,
    required this.alternativas,
    required this.correta,
  });

  /// Texto da alternativa correta (ex.: "6 jogadores").
  String get textoCorreto => alternativas[letras.indexOf(correta)];
}

/// Um nível de dificuldade com sua lista de perguntas.
class Nivel {
  final String nome;
  final List<Pergunta> perguntas;

  const Nivel(this.nome, this.perguntas);
}
