import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:materna/widgets/page_background.dart';
import 'package:materna/widgets/textos_encabezado.dart';
import 'package:materna/widgets/titulos_appbar_page.dart';

class Edadgestacionalfur extends StatefulWidget {
  @override
  _EdadgestacionalfurState createState() => _EdadgestacionalfurState();
}

class _EdadgestacionalfurState extends State<Edadgestacionalfur> {
  //variables a utilizar
  String _fecha = '';
  String _fechaFUR = '';
  DateTime picketFUR;

  //textcontroles de los botones de fechas
  TextEditingController _inputFieldFURController = new TextEditingController();

  TextEditingController _inputFieldFecEvaController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff800040),
          title: TituloAppBar(
              text: 'Edad gestacional', icon: Icons.calendar_today),
        ),
        body: Stack(
          children: [
            PageBackground(
              colorprimario: Colors.blue,
              colorsecunadrio: Colors.lightBlue,
            ),
            _crearListado(context)
          ],
        ));
  }

  Widget _crearListado(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      children: [
        TextoEncabezado(
          text: 'Edad Gestacional según la fecha de última regla (FUR)',
        ),
        _crearImputFUR(context),
      ],
    );
  }

  Widget _crearImputFUR(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: TextField(
        keyboardType: TextInputType.datetime,
        controller: _inputFieldFURController,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: 'dd/mm/aaaa',
            labelText: 'Fecha de última regla',
            icon: Icon(Icons.calendar_today),
            suffixIcon: Icon(Icons.perm_contact_calendar)),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _seleccionarFUR(context);
        },
      ),
    );
  }

//pendiente
  Future _seleccionarFUR(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1900),
        lastDate: new DateTime(3000),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fechaFUR = DateFormat('dd-MM-yyyy').format(picked);
        _inputFieldFURController.text = _fechaFUR;
        picketFUR = picked;
      });
    }
  }
}
