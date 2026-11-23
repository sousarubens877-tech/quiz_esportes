import 'package:quiz_esportes/quiz_esportes.dart';

void main() {
  exibirBoasVindas();

  final ranking = <Resultado>[];
  var nome = lerNome();
  var continuar = true;

  while (continuar) {
    final nivel = escolherNivel(nome);
    final resultado = jogarPartida(nome, nivel);
    ranking.add(resultado);
    exibirRanking(ranking);

    final opcao = menuFinal();
    if (opcao == 2) {
      print('');
      nome = lerNome();
    } else if (opcao == 3) {
      continuar = false;
    }
  }

  print('');
  print('Obrigado por jogar o Quiz dos Esportes. Até a próxima!');
}
