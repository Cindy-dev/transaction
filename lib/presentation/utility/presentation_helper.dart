import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transaction/data/dataProviders/transaction_data.dart';
import '../../data/models/transaction_model.dart';

Widget rowText(
  String text,
  Color color,
) {
  return Text(
    text,
    style: TextStyle(color: color, fontWeight: FontWeight.w600),
  );
}

void showSearchBar(BuildContext context, TextEditingController search,
    List<TransactionModel> foundTransaction) {
  showModalBottomSheet(
      context: context,
      builder: (context) => Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black54,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                        controller: search,
                        onChanged: (value) {
                          //creating a method to rebuild the ui once the typed name is found
                          foundTransaction = transactionList
                              .where((transaction) => transaction.name
                                  .toLowerCase()
                                  .contains(value))
                              .toList();
                        })),
                Expanded(
                    //if the text typed is found in the list of transactions then we can display it in a listview
                    child: foundTransaction.isNotEmpty
                        ? ListView.builder(
                            itemCount: foundTransaction.length,
                            itemBuilder: (context, i) {
                              final transaction = foundTransaction[i];
                              //alt + enter for quick assist
                              return Card(
                                child: ListTile(
                                  title: Text(transaction.name),
                                  onTap: () {
                                    transaction;
                                    Navigator.pushNamed(context, '/display',
                                        arguments: transaction.name);
                                  },
                                ),
                              );
                            })
                        //if not found we throw a text to show it doesnt exist
                        : const Center(
                            child: Text('No transaction data found')))
              ],
            ),
          ));
}
