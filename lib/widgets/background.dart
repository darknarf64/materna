import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final boxDecoration = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
        Color(0xff800040),
        Color(0xff4F0027),
      ]));
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //gradiente guinda
        Container(
          decoration: boxDecoration,
        ),
        // cajas
        Positioned(top: 100, left: -300, child: _SegundaCajaDecorativas()),
        Positioned(top: -100, left: -150, child: _CajasDecorativas()),
      ],
    );
  }
}

class _CajasDecorativas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        width: 320,
        height: 320,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xffD10067),
                  Color(0xffF56CAF),
                ])),
      ),
    );
  }
}

class _SegundaCajaDecorativas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        width: 640,
        height: 640,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(360),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xffD10067),
                  Color(0xffF56CAF),
                ])),
      ),
    );
  }
}
