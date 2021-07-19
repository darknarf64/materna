import 'package:flutter/material.dart';
import 'package:materna/class/evaluacion_ganancia_peso.dart';
import 'package:materna/widgets/listTitle_resultados.dart';
import 'package:materna/widgets/page_background.dart';
import 'package:materna/widgets/textos_encabezado.dart';
import 'package:materna/widgets/titulos_appbar_page.dart';

class Enutpregestacional extends StatefulWidget {
  @override
  _EnutpregestacionalState createState() => _EnutpregestacionalState();
}

class _EnutpregestacionalState extends State<Enutpregestacional> {
  //variables de uso
  String _peso = '';
  String _talla = '';

//variables de resultados
  double _imc = 0.0;
  String _estadonutricionalIMC = '';
  bool _visibility = false;

  //instancia de evaluación nutricional
  EvaluacionNutricional evaluacion = new EvaluacionNutricional();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff800040),
          title: TituloAppBar(
              text: 'Est. Nut. Pre Gestacional', icon: Icons.assignment),
        ),
        body: Stack(
          children: [
            PageBackground(
              colorprimario: Colors.pinkAccent,
              colorsecunadrio: Colors.pink,
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
            text: 'Estado nutricional según IMC pre-gestacional',
          ),
          Divider(),
          _crearInputPeso(),
          Divider(),
          _crearInputTalla(),
          Divider(),
          _botonCalcular(),
          Divider(),
          _listadeResultados()
        ],
      ),
    );
  }

  //crea el input del peso
  Widget _crearInputPeso() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: 'Peso en Kg',
          labelText: 'Peso pre-gestacional',
          helperText: '$_peso kg',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_balance),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (valor) {
        setState(() {
          _peso = valor;
        });
      },
    );
  }

//crea el input de la talla
  Widget _crearInputTalla() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: 'Talla en cm',
          labelText: 'Talla',
          helperText: '$_talla cm',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_balance),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (valor) {
        setState(() {
          _talla = valor;
        });
      },
    );
  }

  Widget _botonCalcular() {
    return ElevatedButton(
        child: Text('Calcular'),
        onPressed: _revisarLlenadocompleto()
            ? null
            : () {
                _imc = evaluacion.calcularIMC(_peso, _talla);
                _estadonutricionalIMC = evaluacion.estadoNutIMC(_imc);
                setState(() {
                  _visibility = true;
                });
              });
  }

  bool _revisarLlenadocompleto() {
    if (_peso.isEmpty ||
        _talla.isEmpty ||
        double.tryParse(_peso) == null ||
        double.tryParse(_talla) == null) {
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
            border: Border.all(color: Colors.pinkAccent, width: 3)),
        child: Column(
          children: [
            TextoResultados(
              title: Text(_imc.toString()),
              subtitle: Text('IMC pre-gestacional'),
              icon: Icon(Icons.check),
            ),
            TextoResultados(
              title: Text(_estadonutricionalIMC),
              subtitle: Text('Estado nutricional pre-gestacional'),
              icon: Icon(Icons.check),
            ),
          ],
        ),
      ),
    );
  }
}
