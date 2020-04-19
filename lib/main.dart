import 'package:dispensa/models/transacao.dart';
import 'package:flutter/material.dart';

main() => runApp(DespensasApp());

class DespensasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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
      value: 211.30,
      date: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Pessoais"),
      ),
      body: Column(
        //espaço entre as colunas
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //esticar a a linha
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.blue,
            child: Card(
              elevation: 5,
              child: Text("graficos"),
            ),
          ),
          Card(
            child: Text("Lista de despesa"),
          )
        ],
      ),
    );
  }
}
