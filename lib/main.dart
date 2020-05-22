import 'package:dispensa/components/transacao_form.dart';
import 'package:dispensa/components/transcao_lista.dart';
import 'dart:math';
import 'package:dispensa/models/transacao.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

main() => runApp(DespensasApp());

class DespensasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR', null);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepPurple,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transacao> _tranactions = [
    // Transacao(
    //     id: 't1',
    //     title: 'Tenis de Corrida',
    //     value: 310.76,
    //     date: DateTime.now()),
    // Transacao(
    //   id: 't2',
    //   title: 'Conta de Luz',
    //   value: 50.99,
    //   date: DateTime.now(),
    // )
  ];

  _addTransacao(String title, double value) {
    final newTransacao = Transacao(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _tranactions.add(newTransacao);
    });

    Navigator.of(context).pop();
  }

  _openTranscationFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransacaoForm(_addTransacao);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Pessoais"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _openTranscationFormModal(context)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
            TransacaoLista(_tranactions)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _openTranscationFormModal(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
