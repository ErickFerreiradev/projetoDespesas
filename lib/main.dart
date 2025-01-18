import 'package:expenses/components/transaction_user.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'package:intl/intl.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        backgroundColor: const Color.fromARGB(255, 47, 117, 49),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            child: Card(
              color: Colors.green,
              child: Text('Gráfico'),
              elevation: 5,
            ),
          ),
           TransactionUser(),
        ],
      ),
    );
  }
}
