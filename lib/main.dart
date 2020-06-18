import 'package:dispensa/components/chart.dart';
import 'package:dispensa/components/transacao_form.dart';
import 'package:dispensa/components/transcao_lista.dart';
import 'dart:math';
import 'package:dispensa/models/transacao.dart';
import 'package:flutter/material.dart';

main() => runApp(DespensasApp());

class DespensasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepPurple,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
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
    //     date: DateTime.now().subtract(Duration(days: 4))),
    // Transacao(
    //   id: 't2',
    //   title: 'Conta de Luz',
    //   value: 50.99,
    //   date: DateTime.now().subtract(Duration(days: 3)),
    // ),
    // Transacao(
    //   id: 't3',
    //   title: 'Conta de Agua',
    //   value: 30.00,
    //   date: DateTime.now().subtract(Duration(days: 2)),
    // )
  ];
  bool _showChart = false;
  List<Transacao> get _recentTransactions {
    return _tranactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _addTransacao(String title, double value, DateTime data) {
    final newTransacao = Transacao(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: data,
    );

    setState(() {
      _tranactions.add(newTransacao);
    });

    Navigator.of(context).pop();
  }

  _deleteTransaction(String id) {
    setState(() {
      _tranactions.removeWhere((tr) => tr.id == id);
    });
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
    final appBar = AppBar(
      title: Text("Despesas Pessoais"),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTranscationFormModal(context)),
      ],
    );

    final availableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          //esticar a a linha
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Grafico"),
                Switch(
                  value: _showChart,
                  onChanged: (value) {
                    setState(() {
                      _showChart = value;
                    });
                  },
                ),
              ],
            ),
            _showChart
                ? Container(
                    height: availableHeight * 0.4,
                    child: Chart(_recentTransactions),
                  )
                : Container(
                    height: availableHeight * 0.6,
                    child: TransacaoLista(
                      _tranactions,
                      _deleteTransaction,
                    ),
                  ),
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
