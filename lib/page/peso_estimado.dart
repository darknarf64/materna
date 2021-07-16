import 'package:flutter/material.dart';
import 'package:materna/class/evaluacion_ganancia_peso.dart';
import 'package:materna/widgets/listTitle_resultados.dart';
import 'package:materna/widgets/page_background.dart';
import 'package:materna/widgets/textos_encabezado.dart';
import 'package:materna/widgets/titulos_appbar_page.dart';

class Pesoestimado extends StatefulWidget {
  @override
  _PesoestimadoState createState() => _PesoestimadoState();
}

class _PesoestimadoState extends State<Pesoestimado> {
  //variables para el calculo
  String _peso = '';
  String _talla = '';
  String _valorSemana = '1';
  String _valordias = '0';
  int _emultiple = 1;
  String _pesoEstimadoString = '';
  String _imcPregestacionalString = '';
  String _estadoNutPreGestString = '';

//variables para el resultado
  bool _visibility = false;

  //instancias
  EvaluacionGananciaPeso evaluacion = new EvaluacionGananciaPeso();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff800040),
          title: TituloAppBar(
              text: 'Peso Estimado', icon: Icons.account_balance_wallet),
        ),
        body: Stack(
          children: [
            PageBackground(
              colorprimario: Colors.cyan,
              colorsecunadrio: Colors.cyanAccent,
            ),
            _crearListado(context)
            //_crearListado(context)
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
            text: 'Peso Estimado según peso actual y semana gestacional',
          ),
          Divider(),
          _crearInputPeso(),
          Divider(),
          _crearInputTalla(),
          Divider(),
          Text('Edad gestacional en semanas'),
          _crearListadoResultado(),
          Divider(),
          Text('Embarazo múltiple'),
          _crearRadioEmbMultiple(),
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
          labelText: 'Peso',
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

  //crea el listado de la edad gestacional en semanas y días
  Widget _crearListadoResultado() {
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

  _botonCalcular() {
    return ElevatedButton(
        child: Text('Calcular'),
        onPressed: _revisarLlenadocompleto()
            ? null
            : () {
                String estadoNutricional = _calcularEstNut(_peso, _talla);
                List<double> rangoPeso = evaluacion.findPesoSemana(
                    estadoNutricional, _valorSemana, _valordias, _emultiple);
                double pesominimoganado = rangoPeso[0];
                double pesoEstimado = double.parse(_peso) - pesominimoganado;
                double imcPregestacional =
                    calcularIMC(pesoEstimado.toString(), _talla);
                imcPregestacional = imcPregestacional * 10;
                imcPregestacional = (imcPregestacional.roundToDouble()) / 10;
                String estadoPregestacional = estadoNutIMC(imcPregestacional);
                _pesoEstimadoString = pesoEstimado.toString();
                _imcPregestacionalString = imcPregestacional.toString();
                _estadoNutPreGestString = estadoPregestacional;
                setState(() {
                  _visibility = true;
                });
              });
  }

  String _calcularEstNut(String pesoST, String tallaST) {
    double imc = calcularIMC(pesoST, tallaST);
    String estadonutricional;
    estadonutricional = estadoNutIMC(imc);
    return estadonutricional;
  }

  String estadoNutIMC(double imc) {
    String estadonutricional;
    if (imc < 18.5) {
      estadonutricional = 'Bajo peso';
    } else {
      if (imc < 25) {
        estadonutricional = 'Normal';
      } else {
        if (imc < 30) {
          estadonutricional = 'Sobrepeso';
        } else {
          estadonutricional = 'Obesidad';
        }
      }
    }

    return estadonutricional;
  }

  double calcularIMC(String pesoST, String tallaST) {
    double peso = double.parse(pesoST);
    double talla = double.parse(tallaST);
    talla = talla / 100;
    double tallaCuadrado = talla * talla;
    double imc = peso / tallaCuadrado;
    return imc;
  }

  //validar llenado de fechas
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
            border: Border.all(color: Colors.cyan, width: 3)),
        child: Column(
          children: [
            TextoResultados(
              title: Text(_pesoEstimadoString),
              subtitle: Text('Peso pre-gestacional Estimado'),
              icon: Icon(Icons.check),
            ),
            TextoResultados(
              title: Text(_imcPregestacionalString),
              subtitle: Text('IMC pregestacional'),
              icon: Icon(Icons.check),
            ),
            TextoResultados(
              title: Text(_estadoNutPreGestString),
              subtitle: Text('Estado nutricional pre-gestacional'),
              icon: Icon(Icons.check),
            ),
          ],
        ),
      ),
    );
  }
}
