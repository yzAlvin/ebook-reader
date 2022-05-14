import 'package:flutter/material.dart';

import 'topbar.dart';
import 'menu.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      appBar:  Topbar(),
      body: Center( 
      ),

      bottomNavigationBar: Menu(),
    );
  }
}