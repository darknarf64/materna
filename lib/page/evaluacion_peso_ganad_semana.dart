import 'package:flutter/material.dart';
import 'package:materna/class/evaluacion_nutricional.dart';
import 'package:materna/widgets/listTitle_resultados.dart';
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
  String _semana1 = '14';
  String _semana2 = '15';
  String _segundoPeso = '';
  String _estadoNutriPreGES = 'Normal';
  bool _visibility = false;

  //variables de resultado
  EvaluacionNutricional evaluacion = new EvaluacionNutricional();
  double diferenciaPesos = 0.0;
  double pesoPorSemana = 0.0;
  double diferenciaSemanas = 1;
  String resultado = '';
  List<String> gananciasugerida = [
    '0.44 a 0.58 Kg',
    '0.35 a 0.50 Kg',
    '0.23 a 0.33 Kg',
    '0.17 a 0.27 Kg'
  ];
  String resultadoGananciaSugerida = '';

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
          Center(
              child: Text(
            'Entre el 2do y 3er trimestre',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          Center(
              child: Text(
            'Embarazo único',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
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
          Divider(),
          _listadeResultados()
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

  //crea el input del peso primer control
  Widget _inputPesoControl1() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: 'Peso en Kg',
          labelText: 'Peso Control 1',
          helperText: '$_primerPeso kg',
          icon: Icon(Icons.pregnant_woman),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (valor) {
        setState(() {
          _primerPeso = valor;
        });
      },
    );
  }

//widget ROW del primer control listado
  Widget _drowmenuSemana() {
    final _listaSemana = [];
    for (int i = 14; i < 40; i++) {
      _listaSemana.add(i);
    }
//listado del primero control
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

//widget ROW del segundo control listado
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

  //listado semana segudi control
  Widget _drowmenuSemana2() {
    final _listaSemana = [];
    for (int i = 15; i < 41; i++) {
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
          icon: Icon(Icons.pregnant_woman),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (valor) {
        setState(() {
          _segundoPeso = valor;
        });
      },
    );
  }

//crea el listado de estado nutricional pregestacional
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

//boton calcular
  Widget _botonCalcular() {
    return ElevatedButton(
        child: Text('Calcular'),
        onPressed: _revisarLlenadocompleto()
            ? null
            : () {
                diferenciaPesos =
                    evaluacion.diferenciaDePesos(_segundoPeso, _primerPeso);
                diferenciaSemanas =
                    double.parse(_semana2) - double.parse(_semana1);
                pesoPorSemana = diferenciaPesos / diferenciaSemanas;
                pesoPorSemana = (pesoPorSemana * 100);
                pesoPorSemana = pesoPorSemana.roundToDouble();
                pesoPorSemana = pesoPorSemana / 100;
                resultado = evaluacion.compararGananciaPorSemana(
                    pesoPorSemana, _estadoNutriPreGES);
                resultadoGananciaSugerida =
                    _gananciaSugerida(_estadoNutriPreGES);
                FocusScope.of(context).requestFocus(new FocusNode());

                setState(() {
                  _visibility = true;
                });
              });
  }

//control del boton calcular
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
              title: Text(pesoPorSemana.toString()),
              subtitle: Text('Ganancia de peso por semana'),
              icon: Icon(Icons.check),
            ),
            TextoResultados(
              title: Text(resultadoGananciaSugerida),
              subtitle: Text('Ganancia de peso sugerida por semana (Kg/sem)'),
              icon: Icon(Icons.check),
            ),
            TextoResultados(
              title: Text(resultado),
              subtitle:
                  Text('Estado nutricional según ganancia de peso semanal'),
              icon: Icon(Icons.check),
            ),
          ],
        ),
      ),
    );
  }

  String _gananciaSugerida(String estadoNutPre) {
    String _estado = estadoNutPre;
    String _resultado;

    switch (_estado) {
      case 'Bajo peso':
        {
          _resultado = gananciasugerida[0];
        }
        break;

      case 'Normal':
        {
          _resultado = gananciasugerida[1];
        }
        break;

      case 'Sobrepeso':
        {
          _resultado = gananciasugerida[2];
        }

        break;

      case 'Obesidad':
        {
          _resultado = gananciasugerida[3];
        }

        break;

      default:
        {
          _resultado = '';
        }
    }
    return _resultado;
  }
}
