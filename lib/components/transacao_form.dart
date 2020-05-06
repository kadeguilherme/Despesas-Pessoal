import 'package:flutter/material.dart';

class TransacaoForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransacaoForm(this.onSubmit);

  @override
  _TransacaoFormState createState() => _TransacaoFormState();
}

class _TransacaoFormState extends State<TransacaoForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value < 0) {
      return 0;
    }
    //O widget acessa a função que recibida como paramentro
    this.widget.onSubmit(title, value);
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
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text('Cancelar'),
                ),
                Spacer(),
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
