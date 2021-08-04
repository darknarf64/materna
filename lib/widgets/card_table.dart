import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'edadgestFUR');
            },
            child: _SingleCard(
                color: Colors.blue,
                icon: Icons.calendar_today,
                text: 'Edad gestacional según FUR'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'edadgestEco');
            },
            child: _SingleCard(
                color: Colors.deepOrange,
                icon: Icons.preview,
                text: 'Edad gestacional según fecha de ecografía'),
          ),
        ]),
        TableRow(children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'pesoEstimado');
            },
            child: _SingleCard(
                color: Colors.cyanAccent,
                icon: Icons.account_balance_wallet,
                text: 'Peso pregestacional estimado'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'enutIMCPreG');
            },
            child: _SingleCard(
                color: Colors.pinkAccent,
                icon: Icons.assignment,
                text: 'Estado nutrcional según IMC pre-gestacional'),
          ),
        ]),
        TableRow(children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'evaluacionNutricional');
            },
            child: _SingleCard(
                color: Colors.greenAccent,
                icon: Icons.assessment,
                text: 'Evaluación nutricional por ganacias de peso total'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'gananciapesosemana');
            },
            child: _SingleCard(
                color: Colors.purple,
                icon: Icons.sticky_note_2,
                text: 'Evaluación según ganancia de peso por semana'),
          ),
        ]),
        TableRow(children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'alturaUterina');
            },
            child: _SingleCard(
                color: Colors.lightBlue,
                icon: Icons.pregnant_woman,
                text: 'Evaluación según altura uterina por semana gestacional'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'biblio');
            },
            child: _SingleCard(
                color: Colors.lightGreen,
                icon: Icons.library_books,
                text: 'Bibliografía'),
          ),
        ]),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard(
      {Key? key, required this.icon, required this.color, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _CardBackground(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: this.color,
          child: Icon(
            this.icon,
            size: 40,
          ),
          radius: 35,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          this.text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: this.color, fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    ));
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;

  const _CardBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            //margin: EdgeInsets.all(15),
            height: 180,
            decoration: BoxDecoration(
                color: Color.fromRGBO(128, 0, 54, 0.5),
                borderRadius: BorderRadius.circular(20)),
            child: this.child,
          ),
        ),
      ),
    );
  }
}
