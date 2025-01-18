import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatelessWidget {
   TransactionForm(this.onSubmit, {super.key});

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;


  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Título',
                    ),
                  ),
                  TextField(
                    controller: valueController,
                    decoration: InputDecoration(
                      labelText: 'Valor (R\$)',
                  ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          final title = titleController.text;
                          final value = double.tryParse(valueController.text) ?? 0.0;
                          onSubmit(title, value);
                        }, 
                        child: Text('Novo Lançamento', style: TextStyle(color: Colors.green)), 
                        ),
                    ],
                  ),
                ],
              ),
            )
          );
  }
}