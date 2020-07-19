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
        brightness: Brightness.dark,
        accentColor: Colors.pinkAccent[400],
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              button: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 27,
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
  final List<Transacao> _tranactions = [];
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
    final mediaquery = MediaQuery.of(context);
    bool _isLadscape = mediaquery.orientation ==
        Orientation.landscape; //comparar se a orientação esta no paisagem

    final appBar = AppBar(
      title: Text(
        "Despesas Pessoais",
      ),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              colors: [
                Color(0xFF323232),
                Color(0xFF4B4453),
              ]),
        ),
      ),
      actions: <Widget>[
        if (_isLadscape)
          IconButton(
              icon: Icon(_showChart ? Icons.list : Icons.show_chart),
              onPressed: () {
                setState(() {
                  _showChart = !_showChart;
                });
              }),
      ],
    );

    final availableHeight = mediaquery.size.height -
        appBar.preferredSize.height -
        mediaquery.padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          //esticar a a linha
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (_showChart || !_isLadscape)
              Container(
                height: availableHeight * (!_isLadscape ? 0.3 : 0.6),
                //color: Colors.black,
                child: Chart(_recentTransactions),
              ),
            if (!_showChart || !_isLadscape)
              Container(
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
          isExtended: true,
          child: Icon(Icons.add),
          onPressed: () => _openTranscationFormModal(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
