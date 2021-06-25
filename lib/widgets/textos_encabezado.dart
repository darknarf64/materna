import 'package:flutter/material.dart';

class TextoEncabezado extends StatelessWidget {
  final String text;

  const TextoEncabezado({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      child: Text(
        this.text,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}
