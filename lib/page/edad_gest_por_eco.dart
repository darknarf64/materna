import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:materna/widgets/listTitle_resultados.dart';

import 'package:materna/widgets/titulos_appbar_page.dart';
import 'package:materna/widgets/page_background.dart';
import 'package:materna/widgets/textos_encabezado.dart';

class EdadSegunEcografia extends StatefulWidget {
  //variables a utilizar
  @override
  _EdadSegunEcografiaState createState() => _EdadSegunEcografiaState();
}

class _EdadSegunEcografiaState extends State<EdadSegunEcografia> {
  //variables de registro
  String _fechaEvaluacion = '';
  String _valorSemana = '4';
  String _valordias = '0';
  String _fechaEco = '';

  //variables de resultados
  String semanasYdias = '';
  String semanas = '';
  String dias = '';
  String fpp = '';
  String fur = '01/01/2021';
  bool _visibility = false;

//para las fechas
  DateTime picketEco = DateTime.now();
  DateTime picketFechaEva = DateTime.now();
  TextEditingController _inputFieldControlerFechaECO =
      new TextEditingController();
  TextEditingController _inputFieldControllerFechaEVA =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff800040),
          title: TituloAppBar(
              text: 'Edad Gest. por Ecografía', icon: Icons.preview),
        ),
        body: Stack(
          children: [
            PageBackground(
              colorprimario: Colors.deepOrange,
              colorsecunadrio: Colors.orangeAccent,
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
            text: 'Edad Gestacional según fecha de ecografía',
          ),
          Divider(),
          Text('Ingrese la fecha de la ecografía'),
          _crearInputFechaEco(context),
          Text('Resultado de la ecografía'),
          _crearListadoResultado(),
          Divider(),
          Text('Ingrese la fecha actual o de evaluación'),
          _crearImputFechaEva(context),
          Divider(),
          _crearBotonCalcular(),
          Divider(),
          _listadeResultados()
        ],
      ),
    );
  }

  Visibility _listadeResultados() {
    return Visibility(
      visible: _visibility,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.blueAccent, width: 3)),
        child: Column(
          children: [
            TextoResultados(
              title: Text(fur),
              subtitle: Text('Fecha de última regla calculada'),
              icon: Icon(Icons.check),
            ),
            TextoResultados(
              title: Text(dias),
              subtitle: Text('Dias'),
              icon: Icon(Icons.check),
            ),
            TextoResultados(
              title: Text(semanas),
              subtitle: Text('Semana gestacional'),
              icon: Icon(Icons.check),
            ),
            TextoResultados(
              title: Text(semanasYdias),
              subtitle: Text('Semanas y días de gestación'),
              icon: Icon(Icons.check),
            ),
            TextoResultados(
              title: Text(fpp),
              subtitle: Text('Fecha probable de parto'),
              icon: Icon(Icons.check),
            )
          ],
        ),
      ),
    );
  }

  Widget _crearInputFechaEco(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: TextField(
        keyboardType: TextInputType.datetime,
        controller: _inputFieldControlerFechaECO,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: 'dd/mm/aaaa',
            labelText: 'Fecha de ecografía',
            icon: Icon(Icons.calendar_today),
            suffixIcon: Icon(Icons.preview)),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _seleccionarFechaEco(context);
        },
      ),
    );
  }

  Future _seleccionarFechaEco(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: picketEco,
        firstDate: new DateTime(2000),
        lastDate: new DateTime(2200),
        locale: Locale('es', 'ES'));

    if (picked != null && picked != picketEco) {
      setState(() {
        picketEco = picked;
        _fechaEco = DateFormat('dd-MM-yyyy').format(picked);
        _inputFieldControlerFechaECO.text = _fechaEco;
      });
    }
  }

  Widget _crearImputFechaEva(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: TextField(
        keyboardType: TextInputType.datetime,
        controller: _inputFieldControllerFechaEVA,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: 'dd/mm/aaaa',
            labelText: 'Fecha de evaluación',
            icon: Icon(Icons.calendar_today_outlined),
            suffixIcon: Icon(Icons.pregnant_woman_outlined)),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _seleccionarFechaEVA(context);
        },
      ),
    );
  }

  Future _seleccionarFechaEVA(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: picketFechaEva,
        firstDate: new DateTime(2000),
        lastDate: new DateTime(2200),
        locale: Locale('es', 'ES'));

    if (picked != null && picked != picketFechaEva) {
      setState(() {
        picketFechaEva = picked;
        _fechaEvaluacion = DateFormat('dd-MM-yyyy').format(picked);
        _inputFieldControllerFechaEVA.text = _fechaEvaluacion;
      });
    }
  }

  Widget _crearListadoResultado() {
    final _listaSemana = [];
    for (int i = 4; i < 43; i++) {
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

  //validar llenado de fechas
  bool _revisarLlenadodeFechas() {
    if (_fechaEvaluacion.isEmpty ||
        _fechaEco.isEmpty ||
        picketFechaEva.difference(picketEco).inDays < 0) {
      return true;
    } else {
      return false;
    }
  }

  //crea el boton calcular
  Widget _crearBotonCalcular() {
    return ElevatedButton(
        onPressed: _revisarLlenadodeFechas()
            ? null
            : () {
                FocusScope.of(context).requestFocus(new FocusNode());
                // List resultados = _funcionBotonCalcular(picketFUR, picketFecha);
                // setState(() {
                //   semanas = resultados[0];
                //   dias = resultados[1];
                //   semanasYdias = resultados[2];
                //   fpp = resultados[3];
                // });

                setState(() {
                  _visibility = true;
                });
              },
        child: Text('Calcular'));
  }
}
