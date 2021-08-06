import 'package:flutter/material.dart';
import 'package:materna/class/evaluacion_nutricional.dart';
import 'package:materna/widgets/listTitle_resultados.dart';
import 'package:materna/widgets/page_background.dart';
import 'package:materna/widgets/textos_encabezado.dart';
import 'package:materna/widgets/titulos_appbar_page.dart';

class EvaluacionNutricionalTotal extends StatefulWidget {
  @override
  _EvaluacionNutricionalTotalState createState() =>
      _EvaluacionNutricionalTotalState();
}

class _EvaluacionNutricionalTotalState
    extends State<EvaluacionNutricionalTotal> {
  //variables de uso
  String _peso = '';
  String _pesoPreges = '';
  String _talla = '';
  int _emultiple = 1;
  String _valorSemana = '1';
  String _valordias = '0';
  double pesominimo = 0.0;
  double pesomaximo = 0.0;
  double diferenciaPesos = 0.0;
  String estadoGananciaPeso = '';

//variables de resultados
  double _imcpregest = 0.0;
  String _estadonutricionalIMCpreget = '';
  bool _visibility = false;
  String _rangodepesos = '';

  //instancia de evaluación nutricional
  EvaluacionNutricional evaluacion = new EvaluacionNutricional();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff800040),
          title: TituloAppBar(
              text: 'Evaluacion nutricional', icon: Icons.assessment),
        ),
        body: Stack(
          children: [
            PageBackground(
              colorprimario: Colors.greenAccent,
              colorsecunadrio: Colors.green,
            ),
            _crearListado(context)
          ],
        ));
  }

//crea el listado de widgets
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
          _crearInputPesoPregestacional(),
          Divider(),
          Text('Edad Gestacional'),
          _crearListadoSemanaGestacional(),
          Divider(),
          Text('Embarazo múltiple'),
          _crearRadioEmbMultiple(),
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
          labelText: 'Peso actual',
          helperText: '$_peso kg',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.pregnant_woman_sharp),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (valor) {
        setState(() {
          _peso = valor;
        });
      },
    );
  }

  //crea el input del peso pre gestacional
  Widget _crearInputPesoPregestacional() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: 'Peso en Kg',
          labelText: 'Peso pre-gestacional',
          helperText: '$_pesoPreges kg',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.settings_accessibility),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (valor) {
        setState(() {
          _pesoPreges = valor;
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
          labelText: 'Talla actual',
          helperText: '$_talla cm',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.expand),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (valor) {
        setState(() {
          _talla = valor;
        });
      },
    );
  }

//boton calcular
  Widget _botonCalcular() {
    return ElevatedButton(
        child: Text('Calcular'),
        onPressed: _revisarLlenadocompleto()
            ? null
            : () {
                _imcpregest = evaluacion.calcularIMC(_pesoPreges, _talla);
                _estadonutricionalIMCpreget =
                    evaluacion.estadoNutIMC(_imcpregest);
                List<double> pesosEsperado = evaluacion.findPesoSemana(
                    _estadonutricionalIMCpreget,
                    _valorSemana,
                    _valordias,
                    _emultiple);
                pesominimo = pesosEsperado[0];
                pesomaximo = pesosEsperado[1];
                _rangodepesos =
                    '${pesominimo.toString()}Kg a ${pesomaximo.toString()}Kg';
                diferenciaPesos =
                    evaluacion.diferenciaDePesos(_peso, _pesoPreges);
                estadoGananciaPeso = evaluacion.estadoDeGananciaDePeso(
                    _peso, _pesoPreges, pesominimo, pesomaximo);
                FocusScope.of(context).requestFocus(new FocusNode());

                setState(() {
                  _visibility = true;
                });
              });
  }

  bool _revisarLlenadocompleto() {
    if (_peso.isEmpty ||
        _talla.isEmpty ||
        _pesoPreges.isEmpty ||
        double.tryParse(_peso) == null ||
        double.tryParse(_talla) == null ||
        double.tryParse(_pesoPreges) == null) {
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
            border: Border.all(color: Colors.greenAccent, width: 3)),
        child: Column(
          children: [
            TextoResultados(
              title: Text(_imcpregest.toString()),
              subtitle: Text('IMC pre-gestacional'),
              icon: Icon(Icons.check),
            ),
            TextoResultados(
              title: Text(_estadonutricionalIMCpreget),
              subtitle: Text('Estado nutricional pre-gestacional'),
              icon: Icon(Icons.check),
            ),
            TextoResultados(
              title: Text(_rangodepesos),
              subtitle: Text('Peso mínimo y máximo esperado'),
              icon: Icon(Icons.check),
            ),
            TextoResultados(
              title: Text(diferenciaPesos.toString()),
              subtitle: Text('Ganancia total de peso'),
              icon: Icon(Icons.check),
            ),
            TextoResultados(
              title: Text(estadoGananciaPeso),
              subtitle: Text('Estado Nutricional según ganancia de peso'),
              icon: Icon(Icons.check),
            ),
          ],
        ),
      ),
    );
  }

  //crea el listado de la edad gestacional en semanas y días
  Widget _crearListadoSemanaGestacional() {
    final _listaSemana = [];
    for (int i = 1; i < 41; i++) {
      _listaSemana.add(i);
    }

    final _listadias = [0, 1, 2, 3, 4, 5, 6];
    return Row(
      children: [
        Expanded(flex: 1, child: Text('Semanas:  ')),
        Expanded(
          flex: 1,
          child: Center(
            child: DropdownButton(
              items: _listaSemana
                  .map((e) => DropdownMenuItem(
                      value: e.toString(), child: Text(e.toString())))
                  .toList(),
              onChanged: (_value) => {
                setState(() {
                  _valorSemana = _value.toString();
                })
              },
              hint: Text(_valorSemana),
            ),
          ),
        ),
        Container(
          width: 80,
        ),
        Expanded(flex: 1, child: Text('días:  ')),
        Expanded(
          flex: 1,
          child: Center(
            child: DropdownButton(
              items: _listadias
                  .map((e) => DropdownMenuItem(
                      value: e.toString(), child: Text(e.toString())))
                  .toList(),
              onChanged: (_value) => {
                setState(() {
                  _valordias = _value.toString();
                })
              },
              hint: Text(_valordias),
            ),
          ),
        ),
      ],
    );
  }

  //crea los botones de sexo
  Widget _crearRadioEmbMultiple() {
    return Container(
      child: Column(
        children: <Widget>[
          RadioListTile(
              value: 0,
              groupValue: _emultiple,
              title: Text('Sí'),
              onChanged: (value) {
                setState(() {
                  _emultiple = value as int;
                });
              }),
          RadioListTile(
              value: 1,
              groupValue: _emultiple,
              title: Text('No'),
              onChanged: (value) {
                setState(() {
                  _emultiple = value as int;
                });
              })
        ],
      ),
    );
  }
}
