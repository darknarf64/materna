import 'package:flutter/material.dart';

class TituloAppBar extends StatelessWidget {
  final String text;
  final IconData icon;

  const TituloAppBar({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(this.icon),
        SizedBox(
          width: 10.0,
        ),
        Text(
          this.text,
          style: TextStyle(fontSize: 12.0),
        )
      ],
    );
  }
}
