import 'package:flutter/material.dart';
import 'package:materna/widgets/titulos_appbar_page.dart';

class EdadSegunEcografia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff800040),
        title:
            TituloAppBar(text: 'Edad Gest. por Ecografía', icon: Icons.preview),
      ),
      body: Container(
        color: Colors.lightBlue,
      ),
    );
  }
}
