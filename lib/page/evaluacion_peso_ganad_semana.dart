import 'package:flutter/material.dart';
import 'package:materna/widgets/titulos_appbar_page.dart';

class GananciaPesoPorSemana extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff800040),
        title: TituloAppBar(
            text: 'Ganancia de peso por semana', icon: Icons.sticky_note_2),
      ),
      body: Container(
        color: Colors.lightBlue,
      ),
    );
  }
}
