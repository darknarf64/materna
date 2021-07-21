import 'package:flutter/material.dart';
import 'package:materna/widgets/page_background.dart';
import 'package:materna/widgets/textos_encabezado.dart';
import 'package:materna/widgets/titulos_appbar_page.dart';

class GananciaPesoPorSemana extends StatefulWidget {
  @override
  _GananciaPesoPorSemanaState createState() => _GananciaPesoPorSemanaState();
}

class _GananciaPesoPorSemanaState extends State<GananciaPesoPorSemana> {
  //variables de uso
  String _primerPeso = '';
  String _semana1 = '1';
  String _semana2 = '2';
  String _segundoPeso = '';
  String _estadoNutriPreGES = 'Normal';
  bool _visibility = false;
  double diferenciaPeso = 0.0;
  int diferenciaSemana = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff800040),
          title: TituloAppBar(
              text: 'Ganancia de peso por semana', icon: Icons.sticky_note_2),
        ),
        body: Stack(
          children: [
            PageBackground(
              colorprimario: Colors.deepPurple,
              colorsecunadrio: Colors.purple,
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
            text: 'Evaluación nutricional según ganancia de peso por semana',
          ),
          Divider(),
          Text('Control 1'),
          _crearPrimerControl(),
          Divider(),
          Text('Control 2'),
          _crearSegundoControl(),
          Divider(),
          Text('Estado nutricional pre-gestacional'),
          _crarlistadoENut(),
          // Divider(),
          _botonCalcular(),

          // Divider(),
          // _listadeResultados()
        ],
      ),
    );
  }

  Widget _crearPrimerControl() {
    return Row(
      children: [
        Expanded(flex: 1, child: Text('Semana Gestacional')),
        Expanded(
          flex: 1,
          child: Center(
            child: _drowmenuSemana(),
          ),
        ),
        Expanded(flex: 2, child: _inputPesoControl1())
      ],
    );
  }

  //crea el input del peso pre gestacional
  Widget _inputPesoControl1() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: 'Peso en Kg',
          labelText: 'Peso Control 1',
          helperText: '$_primerPeso kg',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_balance),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (valor) {
        setState(() {
          _primerPeso = valor;
        });
      },
    );
  }

//listado semana primer control
  Widget _drowmenuSemana() {
    final _listaSemana = [];
    for (int i = 1; i < 40; i++) {
      _listaSemana.add(i);
    }

    return DropdownButton(
      items: _listaSemana
          .map((e) =>
              DropdownMenuItem(value: e.toString(), child: Text(e.toString())))
          .toList(),
      onChanged: (_value) => {
        setState(() {
          _semana1 = _value.toString();
        })
      },
      hint: Text(_semana1),
    );
  }

  Widget _crearSegundoControl() {
    return Row(
      children: [
        Expanded(flex: 1, child: Text('Semana Gestacional')),
        Expanded(
          flex: 1,
          child: Center(
            child: _drowmenuSemana2(),
          ),
        ),
        Expanded(flex: 2, child: _inputPesoControl2())
      ],
    );
  }

  //listado semana primer control
  Widget _drowmenuSemana2() {
    final _listaSemana = [];
    for (int i = 1; i < 41; i++) {
      _listaSemana.add(i);
    }

    return DropdownButton(
      items: _listaSemana
          .map((e) =>
              DropdownMenuItem(value: e.toString(), child: Text(e.toString())))
          .toList(),
      onChanged: (_value) => {
        setState(() {
          _semana2 = _value.toString();
        })
      },
      hint: Text(_semana2),
    );
  }

  //crea el input del peso 2do control
  Widget _inputPesoControl2() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: 'Peso en Kg',
          labelText: 'Peso Control 2',
          helperText: '$_segundoPeso kg',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_balance),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (valor) {
        setState(() {
          _segundoPeso = valor;
        });
      },
    );
  }

  Widget _crarlistadoENut() {
    final _estadoNutricional = ['Bajo peso', 'Normal', 'Sobrepeso', 'Obesidad'];

    return DropdownButton(
      items: _estadoNutricional
          .map((e) =>
              DropdownMenuItem(value: e.toString(), child: Text(e.toString())))
          .toList(),
      onChanged: (_value) => {
        setState(() {
          _estadoNutriPreGES = _value.toString();
        })
      },
      hint: Text(_estadoNutriPreGES),
    );
  }

  Widget _botonCalcular() {
    return ElevatedButton(
        child: Text('Calcular'),
        onPressed: _revisarLlenadocompleto()
            ? null
            : () {
                setState(() {
                  _visibility = true;
                });
              });
  }

  bool _revisarLlenadocompleto() {
    if (_primerPeso.isEmpty ||
        _segundoPeso.isEmpty ||
        double.tryParse(_primerPeso) == null ||
        double.tryParse(_segundoPeso) == null ||
        double.parse(_semana2) - double.parse(_semana1) < 1) {
      return true;
    } else {
      return false;
    }
  }
}
