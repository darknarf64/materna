import 'package:flutter/material.dart';
import 'package:materna/widgets/titulos_appbar_page.dart';

class CuadroRecomendaciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff800040),
        title: TituloAppBar(
            text: 'Recomendaciones de Ganancia de peso', icon: Icons.recommend),
      ),
      body: Container(
        color: Colors.lightBlue,
      ),
    );
  }
}
