import 'package:flutter/material.dart';
import 'package:materna/widgets/page_background.dart';
import 'package:materna/widgets/textos_encabezado.dart';
import 'package:materna/widgets/titulos_appbar_page.dart';

class Pesoestimado extends StatefulWidget {
  @override
  _PesoestimadoState createState() => _PesoestimadoState();
}

class _PesoestimadoState extends State<Pesoestimado> {
  String _peso = '';
  String _talla = '';
  String _valorSemana = '1';
  String _valordias = '0';
  int _emultiple = 1;
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
          _botonCalcular(_peso, _talla, _valorSemana, _valordias, _emultiple),
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

  _botonCalcular(String pesoST, String tallaST, String semanagestST,
      String diagestST, int embMultiple) {
    return ElevatedButton(
        child: Text('Calcular'),
        onPressed: () {
          print(pesoST);
        });
  }

//   _accionesCalcular(String pesoST, String tallaST, String semanagestST,
//       String diagestST, int embMultiple) {
//     double peso = double.parse(pesoST);
//     double talla = double.parse(tallaST);
//     talla = talla / 100;
//     double tallaCuadrado = talla * talla;
//     double imc = peso / tallaCuadrado;
//     int semana = int.parse(semanagestST);
//     int dias = int.parse(diagestST);
//     String estadonutricional;

// //comienza sentencia if else
//     if (imc < 18.5) {
//       estadonutricional = 'Bajo peso';
//     } else {
//       if (imc < 25) {
//         estadonutricional = 'Normal';
//       } else {
//         if (imc < 30) {
//           estadonutricional = 'Sobrepeso';
//         } else {
//           estadonutricional = 'Obesidad';
//         }
//       }
//     }
//     //termina sentencia if
//     print(estadonutricional);
//     print(semana);
//     print(dias);
//   }
}
