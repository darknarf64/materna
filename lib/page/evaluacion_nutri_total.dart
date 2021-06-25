import 'package:flutter/material.dart';
import 'package:materna/widgets/titulos_appbar_page.dart';

class EvaluacionNutricionalTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff800040),
        title: TituloAppBar(
            text: 'Evaluacion nutricional', icon: Icons.assessment),
      ),
      body: Container(
        color: Colors.lightBlue,
      ),
    );
  }
}
