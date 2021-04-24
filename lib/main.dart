import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import './resultado.dart';
import './questionario.dart';

main() {
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = [
    {
      'texto': 'Qual é o seu framework favorito?',
      'respostas': [
        {'texto': 'Flutter', 'pontuacao': 10},
        {'texto': 'django', 'pontuacao': 9},
        {'texto': 'Spring', 'pontuacao': 8},
        {'texto': 'Angular', 'pontuacao': 7},
      ],
    },
    {
      'texto': 'Qual é a sua area favorita?',
      'respostas': [
        {'texto': 'Backend', 'pontuacao': 8},
        {'texto': 'Mobile', 'pontuacao': 10},
        {'texto': 'Frontend', 'pontuacao': 7},
        {'texto': 'Fullstack', 'pontuacao': 9},
      ],
    },
    {
      'texto': 'Qual é a sua linguagem favorita?',
      'respostas': [
        {'texto': 'Java', 'pontuacao': 7},
        {'texto': 'Typescript', 'pontuacao': 8},
        {'texto': 'Python', 'pontuacao': 9},
        {'texto': 'Dart', 'pontuacao': 10},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    //for (String textoResp in respostas) {
    //  widgets.add(Resposta(textoResp, _responder));
    //}

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quantoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
