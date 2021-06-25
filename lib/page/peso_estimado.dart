import 'package:flutter/material.dart';
import 'package:materna/widgets/titulos_appbar_page.dart';

class Pesoestimado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff800040),
        title: TituloAppBar(
            text: 'Peso Estimado', icon: Icons.account_balance_wallet),
      ),
      body: Container(
        color: Colors.lightBlue,
      ),
    );
  }
}
