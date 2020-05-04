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
      child: ListView.builder(
        itemCount: transacao.length,
        itemBuilder: (ctx, index) {
          final tr = transacao[index];
          return (Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  'R${tr.value.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    tr.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    DateFormat('d MMM y (E)').format(tr.date),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ));
        },
      ),
    );
  }
}
