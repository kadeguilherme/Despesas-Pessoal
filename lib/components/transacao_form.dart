import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'adpativa_buttom.dart';

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
    //widget acessa a função que é recibida por paramentro
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
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          color: Colors.white70,
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              TextField(
                controller: titleController,
                onSubmitted: (_) => _submitForm(),
                decoration: InputDecoration(
                    labelText: 'Título despesa',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: width * 0.73,
                    child: TextField(
                      controller: valueController,
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) => _submitForm(),
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: 'Valor (R\$) ',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.1,
                    child: FloatingActionButton(
                      backgroundColor: Color(0xFFF845EC2),
                      onPressed: _showDatePicker,
                      child: Icon(
                        Icons.date_range,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _selectedDate == null
                          ? 'Nenhuma data selecionada'
                          : 'Data Selecionada: ${DateFormat("dd 'de' MMMM 'de' y", 'pt_BR').format(_selectedDate)}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: width * 0.040,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AdptativeButton(onPressed: _submitForm),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
