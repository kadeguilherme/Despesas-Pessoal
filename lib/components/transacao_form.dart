import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransacaoForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransacaoForm(this.onSubmit);

  @override
  _TransacaoFormState createState() => _TransacaoFormState();
}

class _TransacaoFormState extends State<TransacaoForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  _submitForm() {
    final _title = titleController.text;
    final _value = double.tryParse(valueController.text) ?? 0.0;

    if (_title.isEmpty || _value < 0 || _selectedDate == null) {
      return 0;
    }
    //O widget acessa a função que recibida como paramentro
    this.widget.onSubmit(_title, _value, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      //ShowDatePicker esperar uma future
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'Nenhuma data selecionada'
                          : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}',
                    ),
                  ),
                  FlatButton(
                    onPressed: _showDatePicker,
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Selecionar Data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
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
                RaisedButton(
                  onPressed: _submitForm,
                  child: Text('Nova Transação'),
                  textColor: Theme.of(context).textTheme.button.color,
                  color: Theme.of(context).primaryColor,
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
