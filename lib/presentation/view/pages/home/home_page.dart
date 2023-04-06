import 'package:flutter/material.dart';
import 'package:setup_provider/presentation/style/style.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Text(
            'Restaurants',
            style: Style.bold(size: 20, color: Style.black),
          )
        ],
      ),
    ));
  }
}
