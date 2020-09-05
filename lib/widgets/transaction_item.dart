import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 8,
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                  '\$${transaction.amount.toStringAsFixed(2)}'),
            ),
          ),
          radius: 30,
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
          style: TextStyle(color: Colors.grey),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                onPressed: () => deleteTx(transaction.id),
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                color: Theme.of(context).errorColor,
                icon: Icon(Icons.delete),
                onPressed: () => deleteTx(transaction.id)),
      ),
    );
  }
}