import 'package:dispensa/components/transacao_user.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:dispensa/components/transacao_user.dart';

main() => runApp(DespensasApp());

class DespensasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR', null);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Pessoais"),
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
            TransacaoUser(),
          ],
        ),
      ),
    );
  }
}
