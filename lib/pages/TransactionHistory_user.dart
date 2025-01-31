import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // Import intl package for date formatting

class TransactionListPage extends StatelessWidget {
  static const String id = '/transaction_list';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction List'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('transaction_list')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No transactions found.'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var transaction = snapshot.data!.docs[index];
              var itemName = transaction['itemName'];
              var itemPrice = transaction['itemPrice'];
              var timestamp = transaction['timestamp'];

              // Convert timestamp to Philippine 12-hour format
              var date = (timestamp as Timestamp).toDate();
              var formattedDate = DateFormat.yMd().add_jm().format(date);

              return ListTile(
                title: Text(itemName as String), // Cast itemName to String
                subtitle:
                    Text('\$${itemPrice.toStringAsFixed(2)}\n$formattedDate'),
              );
            },
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TransactionListPage(),
  ));
}
