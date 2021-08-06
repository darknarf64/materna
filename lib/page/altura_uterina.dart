import 'package:flutter/material.dart';
import 'package:materna/class/evaluacion_nutricional.dart';
import 'package:materna/widgets/listTitle_resultados.dart';
import 'package:materna/widgets/page_background.dart';
import 'package:materna/widgets/textos_encabezado.dart';
import 'package:materna/widgets/titulos_appbar_page.dart';

class ALturaUterina extends StatefulWidget {
  @override
  _ALturaUterinaState createState() => _ALturaUterinaState();
}

class _ALturaUterinaState extends State<ALturaUterina> {
  String _alturaUterina = '';
  String _semanaString = '13';
  bool _visibility = false;

  //variables de resultados
  EvaluacionNutricional evaluacion = new EvaluacionNutricional();
  late List<double> rangoAltUter;
  double min = 0.0;
  double max = 0.0;
  String resultado = '';
  late int semana;
  late double alturaUterina;

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
          _botonCalcular(),
          Divider(),
          _listadeResultados()
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
          suffixIcon: Icon(Icons.pregnant_woman),
          icon: Icon(Icons.brightness_3),
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
          _semanaString = _value.toString();
        })
      },
      hint: Text(_semanaString),
    );
  }

  Widget _botonCalcular() {
    return ElevatedButton(
        child: Text('Calcular'),
        onPressed: _revisarLlenadocompleto()
            ? null
            : () {
                semana = int.parse(_semanaString);
                rangoAltUter = evaluacion.encontrarAlturaUterina(semana);
                min = rangoAltUter[0];
                max = rangoAltUter[1];
                alturaUterina = double.parse(_alturaUterina);
                resultado =
                    evaluacion.compararAlturaUterina(alturaUterina, min, max);
                FocusScope.of(context).requestFocus(new FocusNode());
                setState(() {
                  _visibility = true;
                });
              });
  }

  //control del boton calcular
  bool _revisarLlenadocompleto() {
    if (_alturaUterina.isEmpty ||
        _semanaString.isEmpty ||
        double.tryParse(_alturaUterina) == null ||
        int.tryParse(_semanaString) == null) {
      return true;
    } else {
      return false;
    }
  }

  //crea la lista de resultados
  Visibility _listadeResultados() {
    return Visibility(
      visible: _visibility,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.deepPurple, width: 3)),
        child: Column(
          children: [
            TextoResultados(
              title: Text('P10 = $min a P90 = $max'),
              subtitle: Text(
                  'Rango adecuado de la altura uterina según semana gestacional'),
              icon: Icon(Icons.check),
            ),
            TextoResultados(
              title: Text(resultado),
              subtitle:
                  Text('Evaluación según altura uterina y semana gestacional'),
              icon: Icon(Icons.check),
            ),
          ],
        ),
      ),
    );
  }
}
