import 'dart:math';
import 'dart:io';
import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import '../models/transaction.dart';
import 'components/chart.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  ExpensesApp({Key? key}) : super(key: key);
  final ThemeData tema = ThemeData();
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        useMaterial3: false,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
            
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 84, 129, 86),
          primary: Colors.green,
          secondary: const Color.fromARGB(255, 47, 117, 49),
        ),
        textTheme: tema.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
          

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List <Transaction> _transactions = [];
  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime? date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(), 
      title: title, 
      value: value, 
      date: date!,
      );

    setState(() {
      _transactions.add(newTransaction);
    });
    
    Navigator.of(context).pop();

  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) {
        return tr.id == id;
      });
    });
  }


  _opentransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction) ;
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = 
    MediaQuery.of(context).orientation == Orientation.landscape;

    final actions = [
          if(isLandscape)
           IconButton(
            icon: Icon(_showChart ? Icons.list : Icons.show_chart),
            onPressed: () {
              setState(() {
                _showChart = !_showChart;
              });
            },
            ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _opentransactionFormModal(context),
            ),
        ];

    final PreferredSizeWidget appBar = AppBar(
      title: const Text('Despesas Pessoais'),
      actions: actions,
    ); 
    
    AppBar(
        title: const Text('Despesas Pessoais'),
        actions: actions,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      );
    final availableHeight = mediaQuery.size.height - appBar.preferredSize.height - mediaQuery.padding.top;

    final bodyPage = SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if(_showChart || !isLandscape )
            Container(
              height: availableHeight * (isLandscape ? 0.8 : 0.3),
              child: Chart(_recentTransactions),
              ),
            if(!_showChart || !isLandscape)
              Container(
                height: availableHeight * (isLandscape ? 1 : 0.7),
                child: TransactionList(_transactions, _removeTransaction),
              ),
          ],
        ),
      );

    return Platform.isIOS ? CupertinoPageScaffold(

      child: bodyPage,
      ) 
     : Scaffold(
      appBar: appBar,
      body: bodyPage,
      floatingActionButton: Platform.isIOS ? Container () 
      : FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>  _opentransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
