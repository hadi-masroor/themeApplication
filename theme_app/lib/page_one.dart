import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
        ],
      ),
    );
  }
}