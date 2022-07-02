import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  final dynamic name;
  const DisplayScreen({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(),
    );
  }
}
