import 'package:flutter/material.dart';

class TransacaoForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransacaoForm(this.onSubmit);
  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value < 0) {
      return 0;
    }

    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(labelText: 'Titulo'),
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(labelText: 'Valor R\$ '),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: _submitForm,
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
