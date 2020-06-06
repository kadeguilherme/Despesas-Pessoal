import 'package:dispensa/models/transacao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransacaoLista extends StatelessWidget {
  final List<Transacao> transacao;

  TransacaoLista(this.transacao);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transacao.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Nenhuma Transação Cadastradas",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/imagens/waiting.png',
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transacao.length,
              itemBuilder: (ctx, index) {
                final tr = transacao[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: FittedBox(
                        child: Text('R\$${tr.value}'),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat('dd MMM y').format(tr.date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () {},
                    ),
                  ),
                );
              },
            ),
    );
  }
}
