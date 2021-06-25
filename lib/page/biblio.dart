import 'package:flutter/material.dart';
import 'package:materna/widgets/titulos_appbar_page.dart';

class Bibliografia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff800040),
        title: TituloAppBar(text: 'Bibliografía', icon: Icons.library_books),
      ),
      body: Container(
        color: Colors.lightBlue,
      ),
    );
  }
}
