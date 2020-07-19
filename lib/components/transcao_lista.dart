import 'package:dispensa/models/transacao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransacaoLista extends StatelessWidget {
  final List<Transacao> transacao;

  final void Function(String) onRemove;

  TransacaoLista(this.transacao, this.onRemove);
  @override
  Widget build(BuildContext context) {
    return transacao.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
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
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/imagens/waiting.png',
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: transacao.length,
            itemBuilder: (ctx, index) {
              final tr = transacao[index];

              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: Dismissible(
                  //chave unica
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) => onRemove(tr.id),
                  background: Container(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      color: Colors.red[900],
                      alignment: AlignmentDirectional.centerEnd,
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                        size: 27,
                      ),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat("dd 'de' MMMM 'de' y", 'pt_BR')
                          .format(tr.date),
                      style: TextStyle(color: Colors.white54),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'R\$${tr.value.toStringAsFixed(2)} ',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
