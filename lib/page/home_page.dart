import 'package:flutter/material.dart';
import 'package:materna/widgets/background.dart';
import 'package:materna/widgets/card_table.dart';
import 'package:materna/widgets/page_title.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xff800040),
      //   title: Icon(Icons.home),
      // ),
      body: Stack(
        children: [
          //Background
          Background(),
          _HomeTitulo()
        ],
      ),
    );
  }
}

class _HomeTitulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // titulos
          PageTitle(),
          CardTable()
        ],
      ),
    );
  }
}
