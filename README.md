# Quiz dos Esportes

Jogo de perguntas e respostas (quiz) que roda no terminal, desenvolvido em Dart para o **Desafio 2 — Fazendo meu Quiz com Dart**.

## Integrante

- Rubens Sousa dos Santos

**Programa:** Trilhas 2026
**Trilha:** Desenvolvimento Mobile

## Apresentação do quiz

O **Quiz dos Esportes** testa os conhecimentos do jogador sobre modalidades esportivas, regras e história do esporte: vôlei, futebol, futsal, basquete, natação, atletismo, capoeira e Jogos Olímpicos.

O jogo pergunta o nome do jogador, deixa escolher o nível de dificuldade e apresenta as perguntas uma de cada vez. Ao final, mostra a pontuação (por exemplo, *4 de 5 perguntas corretas*) e uma "medalha" de acordo com o desempenho.

**Tema escolhido:** esportes.

### Exemplo de pergunta

```
Pergunta 1 de 5
Quantos jogadores cada equipe tem em quadra no vôlei?
  A) 5 jogadores
  B) 6 jogadores
  C) 7 jogadores
  D) 11 jogadores
Sua resposta: b
Acertou, Rubens! Ponto para você!
```

## Funcionalidades

**Obrigatórias**

- Nome do quiz e mensagem de boas-vindas.
- Identificação do jogador pelo nome, usado nas mensagens.
- 15 perguntas (5 por nível), cada uma com quatro alternativas (A, B, C e D) e apenas uma correta.
- Perguntas armazenadas em listas e apresentadas com um laço `for`, uma de cada vez.
- Leitura das respostas com `stdin.readLineSync()`.
- Aceita letras maiúsculas ou minúsculas (`A` ou `a`).
- Pede nova resposta quando o jogador digita uma alternativa inválida ou aperta Enter sem responder.
- Informa o acerto e, em caso de erro, mostra a alternativa correta.
- Pontuação final e mensagem que varia conforme o desempenho (ouro, prata, bronze ou incentivo).

**Extras**

- Embaralhamento da ordem das perguntas a cada partida.
- Níveis de dificuldade: Fácil, Médio, Difícil e Desafio total (todas as 15 perguntas).
- Opção de jogar novamente ou trocar de jogador.
- Ranking dos jogadores da sessão, ordenado pelo aproveitamento.
- Testes automatizados (`dart test`).

## Estrutura do projeto

Projeto criado com `dart create`, mantendo a estrutura gerada pelo Dart:

```
quiz_esportes/
├── bin/
│   └── quiz_esportes.dart      # ponto de entrada (main)
├── lib/
│   ├── quiz_esportes.dart      # reúne e exporta os arquivos da lib
│   ├── pergunta.dart           # classes Pergunta e Nivel
│   ├── banco_perguntas.dart    # listas de perguntas de cada nível
│   ├── quiz_logica.dart        # validação, verificação, pontuação e ranking
│   └── interface.dart          # telas, leitura do teclado e partida
├── test/
│   └── quiz_esportes_test.dart # testes automatizados
├── analysis_options.yaml
├── pubspec.yaml
├── CHANGELOG.md
└── README.md
```

## Como executar

É necessário ter o [Dart SDK](https://dart.dev/get-dart) instalado (versão 3.0 ou superior).

```bash
git clone https://github.com/sousarubens877-tech/quiz_esportes.git
cd quiz_esportes
dart pub get
dart run
```

Para rodar os testes automatizados:

```bash
dart test
```

> No Windows, recomenda-se usar o terminal do VS Code ou o Windows Terminal para que os acentos apareçam corretamente.

## Testes realizados

Além dos testes automatizados, o quiz foi executado várias vezes para verificar:

- [x] Todas as perguntas e alternativas aparecem corretamente.
- [x] O programa identifica respostas certas e erradas.
- [x] As respostas incorretas mostram a alternativa correta.
- [x] Letras maiúsculas e minúsculas são aceitas.
- [x] Respostas inválidas (letra errada, número, Enter vazio) pedem nova resposta.
- [x] A pontuação final corresponde à quantidade de acertos.

## Uso de Inteligência Artificial

Utilizei o Claude (Anthropic) como apoio no desenvolvimento:

- **Como ajudou:** sugeriu a organização do projeto em arquivos (`bin` e `lib`), uma primeira versão do código, das perguntas e dos testes automatizados, além de orientar a instalação do Dart e a criação do projeto com `dart create`.
- **O que adaptei:** criei o projeto com `dart create` no meu computador, organizei os arquivos na estrutura gerada, personalizei o README com meus dados e revisei as perguntas e as mensagens do jogo.
- **Como verifiquei:** rodei `dart test` (todos os 9 testes passaram), joguei o quiz várias vezes no terminal testando respostas certas, erradas, minúsculas, inválidas e Enter vazio, e conferi as respostas das perguntas.