import 'package:flutter/material.dart';
import 'package:materna/widgets/titulos_appbar_page.dart';

class ParametrosEcograficos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff800040),
        title:
            TituloAppBar(text: 'Parámetros Ecográficos', icon: Icons.support),
      ),
      body: Container(
        color: Colors.lightBlue,
      ),
    );
  }
}
