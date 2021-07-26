import 'package:flutter/material.dart';
import 'package:materna/widgets/page_background.dart';
import 'package:materna/widgets/textos_encabezado.dart';
import 'package:materna/widgets/titulos_appbar_page.dart';

class ALturaUterina extends StatefulWidget {
  @override
  _ALturaUterinaState createState() => _ALturaUterinaState();
}

class _ALturaUterinaState extends State<ALturaUterina> {
  String _alturaUterina = '';
  String _semana = '13';
  late List<double> rangoAU;
  double min = 0.0;
  double max = 0.0;
  //falta boton calcular, acciones y resultados

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff800040),
          title:
              TituloAppBar(text: 'Altura Uterina', icon: Icons.pregnant_woman),
        ),
        body: Stack(
          children: [
            PageBackground(
              colorprimario: Colors.lightBlue,
              colorsecunadrio: Colors.blue,
            ),
            _crearListado(context)
          ],
        ));
  }

  Widget _crearListado(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          TextoEncabezado(
            text: 'Evaluación por Altura Uterina y semana gestacional',
          ),
          Divider(),
          _crearInputAlturaUterina(),
          Divider(),
          _drowmenuSemana(),
          //_botonCalcular(),
          Divider(),
          //_listadeResultados()
        ],
      ),
    );
  }

  Widget _crearInputAlturaUterina() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: 'cm',
          labelText: 'Altura Uterina',
          helperText: '$_alturaUterina cm',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_balance),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (valor) {
        setState(() {
          _alturaUterina = valor;
        });
      },
    );
  }

  //listado semana segudi control
  Widget _drowmenuSemana() {
    final _listaSemana = [];
    for (int i = 13; i < 41; i++) {
      _listaSemana.add(i);
    }

    return DropdownButton(
      items: _listaSemana
          .map((e) =>
              DropdownMenuItem(value: e.toString(), child: Text(e.toString())))
          .toList(),
      onChanged: (_value) => {
        setState(() {
          _semana = _value.toString();
        })
      },
      hint: Text(_semana),
    );
  }
}
