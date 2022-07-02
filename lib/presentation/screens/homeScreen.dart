import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:transaction/data/dataProviders/transaction_data.dart';
import 'package:transaction/data/models/transaction_model.dart';
import 'package:transaction/presentation/utility/color.dart';
import 'package:transaction/presentation/widgets/bottom_navigation_bar.dart';

import '../utility/presentation_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _search = TextEditingController();
  TransactionModel? selected;
  List<TransactionModel> foundTransaction = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foundTransaction = transactionList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        bottomNavigationBar: const BottomNavigationBarWidget(),
        body: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.yellow,
                            child: rowText('MS', Colors.black),
                          ),
                          rowText('Accounts', Colors.black),
                          rowText('Budget', Colors.black),
                          rowText('Analytics', Colors.black),
                          rowText('Finance', Colors.black),
                        ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 10, right: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              rowText('Transactions', Colors.black54),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showSearchBar(
                                          context, _search, foundTransaction);
                                      _search.clear();
                                    });
                                  },
                                  icon: const Icon(Icons.search)),
                            ],
                          ),
                          Row(
                            children: [
                              rowText("Cashflow this week:", Colors.black54),
                              rowText(' Good', Colors.green),
                              rowText('  -£250', Colors.black54)
                            ],
                          )
                        ]),
                  ),
                  //using a grouped list to view the list of data and also arrange it in a group
                  Expanded(
                    child: GroupedListView<TransactionModel, String>(
                        shrinkWrap: true,
                        //elements are list of data you want to display
                        elements: transactionList,
                        //group by arranges the data based on a universal data
                        groupBy: (transactionList) =>
                            transactionList.date.split(",")[1] +
                            transactionList.date.split(",")[2],
                        groupComparator: (value1, value2) =>
                            value2.compareTo(value1),
                        itemComparator: (item1, item2) =>
                            item1.name.compareTo(item2.name),
                        order: GroupedListOrder.ASC,
                        groupSeparatorBuilder: (String value) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(value,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Text(
                                      "-£ ${transactionList[0].price + transactionList[1].price}")
                                ],
                              ),
                            ),
                        itemBuilder: (c, transactionList) {
                          return Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height * .1,
                              width: double.infinity,
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: AppColors.listTileColor,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.black)),
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).pushNamed(
                                    '/display',
                                    arguments: transactionList.name),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: Image.asset(
                                      transactionList.image,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  title: Text(transactionList.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700)),
                                  subtitle: Text(transactionList.date),
                                  trailing: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        transactionList.price == 120.00
                                            ? Text('+£${transactionList.price}',
                                                textAlign: TextAlign.right,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.green))
                                            : Text('-£${transactionList.price}',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color:
                                                        AppColors.priceColor)),
                                        const SizedBox(height: 6),
                                        Expanded(
                                          child: Text(
                                              transactionList.encryption
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w700)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                        }),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
