import 'package:flutter/material.dart';
import 'package:expenses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction tr;
  final void Function(String p1) onRemove;
  
  const TransactionItem({
    super.key,
    required this.tr,
    required this.onRemove,
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          maxRadius: 30,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                'R\$${tr.value.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                ),
              ),
          ),
        ),
        title: Text(
          tr.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(tr.date),
        ),
        trailing: MediaQuery.of(context).size.width > 480 ?
        TextButton.icon(
                    onPressed: () => onRemove(tr.id),
                    icon: Icon(Icons.delete,
                        color: const Color.fromARGB(255, 78, 78, 78)),
                    label: Text(
                      'Excluir',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 78, 78, 78)),
                    ),
                  ) 
        : IconButton(
          onPressed: () => onRemove(tr.id),
           icon: Icon(Icons.delete),
           color: const Color.fromARGB(255, 78, 78, 78),
           ),
      ),
    );
  }
}
            