import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;
  
  const TransactionList(this.transactions, this.onRemove, {super.key});
  

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty ? LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
      children: [
        SizedBox(height: 20),
        Text(
          'Nenhuma Transação Cadastrada!',
          style: Theme.of(context).textTheme.titleLarge,
        ),
          SizedBox(height: 20),
              SizedBox(
                height: constraints.maxHeight * 0.6,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          );
        },
      ) 
        :
        ListView(
          children: transactions.map((tr) {
            return TransactionItem(
              key: ValueKey(tr.id),
              tr: tr, 
              onRemove: onRemove,
              );
          }).toList(),
        );
        // ListView.builder(
        //   itemCount: transactions.length,
        //   itemBuilder: (ctx, index) {
        //     final tr = transactions[index];
        //     return TransactionItem(tr: tr, onRemove: onRemove);
        //   },
        //   );
  }
}


                  