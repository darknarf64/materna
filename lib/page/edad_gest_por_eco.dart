import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:materna/widgets/titulos_appbar_page.dart';
import 'package:materna/widgets/page_background.dart';
import 'package:materna/widgets/textos_encabezado.dart';

class EdadSegunEcografia extends StatefulWidget {
  //variables a utilizar
  @override
  _EdadSegunEcografiaState createState() => _EdadSegunEcografiaState();
}

class _EdadSegunEcografiaState extends State<EdadSegunEcografia> {
  String _fechaEvaluacion = '';

  String _fechaEco = '';

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
          Text('Ingrese la fecha de la ecografía'),
          _crearInputFechaEco(context),
        ],
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
            labelText: 'Fecha de última regla',
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
}
