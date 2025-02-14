import 'dart:math';
import 'adaptative_button.dart';
import 'adaptative_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'adaptative_datepicker.dart';

class TransactionForm extends StatefulWidget {
   TransactionForm(this.onSubmit, {super.key}); 

  final void Function(String, double, DateTime?) onSubmit;

  @override
  State<TransactionForm> createState() {
    print ('createState Form');
    return _TransactionFormState();
  }
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate = DateTime.now();

  _TransactionFormState() {
    print('Constructor TransactionForm');
  }

  @override
  void initState() {
    super.initState();
    print('initState() _TransactionFormState');
  }

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    
    if(title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);

  }
                    
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  right: 10,
                  left: 10,
                  bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
            children: [
              AdaptativeTextField(
                label: 'Título',
                controller: _titleController,
                onSubmitted: (_) => _submitForm,
              ),
              AdaptativeTextField(
                label: 'Valor (R\$)',
                controller: _valueController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm,
              ),
              AdaptativeDatepicker(
                selectedDate: _selectedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      AdaptativeButton(
                        'Nova transação',
                        _submitForm
                      ),
                      ],
                    ),
                  ],
                ),
              )
            ),
    );
  }
}