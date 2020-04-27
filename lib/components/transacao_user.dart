import 'package:flutter/material.dart';
import 'package:dispensa/components/transcao_lista.dart';
import 'package:dispensa/components/transacao_form.dart';
import '../models/transacao.dart';

class TransacaoUser extends StatefulWidget {
  @override
  _TransacaoUserState createState() => _TransacaoUserState();
}

class _TransacaoUserState extends State<TransacaoUser> {
  final _transacao = [
    Transacao(
      id: 't1',
      title: "Novo Tenis de Corrida",
      value: 310.76,
      date: DateTime.now(),
    ),
    Transacao(
      id: "t2",
      title: "Conta de luz",
      value: 211.0,
      date: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransacaoLista(_transacao),
        TranscaoForm(),
      ],
    );
  }
}
