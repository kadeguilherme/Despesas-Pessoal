import 'package:flutter/material.dart';
import 'dart:math';
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
    ),
    Transacao(
      id: 't5',
      title: "Novo Tenis de Corrida",
      value: 310.76,
      date: DateTime.now(),
    ),
    Transacao(
      id: 't6',
      title: "Novo Tenis de Corrida",
      value: 310.76,
      date: DateTime.now(),
    ),
    Transacao(
      id: 't7',
      title: "Novo Tenis de Corrida",
      value: 310.76,
      date: DateTime.now(),
    ),
    Transacao(
      id: 't8',
      title: "Novo Tenis de Corrida",
      value: 310.76,
      date: DateTime.now(),
    ),
    Transacao(
      id: 't9',
      title: "Novo Tenis de Corrida",
      value: 310.76,
      date: DateTime.now(),
    ),
    Transacao(
      id: 't10',
      title: "Novo Tenis de Corrida",
      value: 30.76,
      date: DateTime.now(),
    ),
  ];

  _addTransacao(String titulo, double valor) {
    final newTransacao = Transacao(
      id: Random().nextDouble().toString(),
      title: titulo,
      value: valor,
      date: DateTime.now(),
    );

    setState(() {
      _transacao.add(newTransacao);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransacaoForm(_addTransacao),
        TransacaoLista(_transacao),
      ],
    );
  }
}
