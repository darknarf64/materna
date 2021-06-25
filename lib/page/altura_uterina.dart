import 'package:flutter/material.dart';
import 'package:materna/widgets/titulos_appbar_page.dart';

class ALturaUterina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff800040),
        title: TituloAppBar(text: 'Altura Uterina', icon: Icons.pregnant_woman),
      ),
      body: Container(
        color: Colors.lightBlue,
      ),
    );
  }
}
