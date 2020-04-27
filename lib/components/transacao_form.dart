import 'package:flutter/material.dart';

class TranscaoForm extends StatelessWidget {
  final title = TextEditingController();
  final value = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: title,
              decoration: InputDecoration(labelText: 'Titulo'),
            ),
            TextField(
              controller: value,
              decoration: InputDecoration(labelText: 'Valor R\$ '),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    print(title.text);
                    print(value.text);
                  },
                  child: Text('Nova Transação'),
                  textColor: Colors.purple[800],
                  splashColor: Colors.purple[50],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
