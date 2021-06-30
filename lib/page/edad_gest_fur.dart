import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:materna/widgets/page_background.dart';
import 'package:materna/widgets/textos_encabezado.dart';
import 'package:materna/widgets/titulos_appbar_page.dart';
import 'package:materna/widgets/listTitle_resultados.dart';

class Edadgestacionalfur extends StatefulWidget {
  @override
  _EdadgestacionalfurState createState() => _EdadgestacionalfurState();
}

class _EdadgestacionalfurState extends State<Edadgestacionalfur> {
  //variables a utilizar
  String _fecha = '';
  String _fechaFUR = '';
  DateTime picketFUR = DateTime.now();
  DateTime picketFecha = DateTime.now();
  bool _visibility = false;

  //variables de resultados
  String semanasYdias = '';
  String semanas = '';
  String dias = '';
  String fpp = '';

  //textcontroles de los botones de fechas
  TextEditingController _inputFieldFURController = new TextEditingController();

  TextEditingController _inputFieldFechaController =
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

//crea el listado de widgets : fechas y botones
  Widget _crearListado(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          TextoEncabezado(
            text: 'Edad Gestacional según la fecha de última regla (FUR)',
          ),
          _crearImputFUR(context),
          Divider(),
          _crearImputFecha(context),
          Divider(),
          _crearBotonCalcular(),
          Divider(),
          Visibility(
            visible: _visibility,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.blueAccent, width: 3)),
              child: Column(
                children: [
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
          )
        ],
      ),
    );
  }

//crea el imput para la fecha de ultima regla
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
            suffixIcon: Icon(Icons.person)),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _seleccionarFUR(context);
        },
      ),
    );
  }

  //crea el metodo de selecionar y marcar la fecha del FUR
  Future _seleccionarFUR(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: picketFUR,
        firstDate: new DateTime(2000),
        lastDate: new DateTime(2200),
        locale: Locale('es', 'ES'));

    if (picked != null && picked != picketFUR) {
      setState(() {
        picketFUR = picked;
        _fechaFUR = DateFormat('dd-MM-yyyy').format(picked);
        // _fechaFUR = picked.toString();
        _inputFieldFURController.text = _fechaFUR;
      });
    }
  }

//crea el input de la fecha actual
  Widget _crearImputFecha(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: TextField(
        keyboardType: TextInputType.datetime,
        controller: _inputFieldFechaController,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: 'dd/mm/aaaa',
            labelText: 'Fecha de evaluación',
            icon: Icon(Icons.calendar_today_outlined),
            suffixIcon: Icon(Icons.pregnant_woman_outlined)),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _seleccionarFecha(context);
        },
      ),
    );
  }

//seleciona fecha actual
  Future _seleccionarFecha(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: picketFecha,
        firstDate: new DateTime(2000),
        lastDate: new DateTime(2200),
        locale: Locale('es', 'ES'));

    if (picked != null && picked != picketFecha) {
      setState(() {
        picketFecha = picked;
        _fecha = DateFormat('dd-MM-yyyy').format(picked);
        _inputFieldFechaController.text = _fecha;
      });
    }
  }

  //validar llenado de fechas
  bool _revisarLlenadodeFechas() {
    if (_fecha.isEmpty ||
        _fechaFUR.isEmpty ||
        picketFecha.difference(picketFUR).inDays < 0) {
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
                List resultados = _funcionBotonCalcular(picketFUR, picketFecha);
                setState(() {
                  semanas = resultados[0];
                  dias = resultados[1];
                  semanasYdias = resultados[2];
                  fpp = resultados[3];
                });

                _visibility = true;
              },
        child: Text('Calcular'));
  }
}

//retorna una lista con 0: semana gestacional, 1: dias totales, 2: semanas y dias, 3:fecha probable de parto
List<String> _funcionBotonCalcular(DateTime fechainicio, DateTime fechaactual) {
  Duration _diferencia = fechaactual.difference(fechainicio);
  int dias = _diferencia.inDays;
  double semanas = dias / 7;
  double resto = semanas % 1;
  double diasresto = resto * 7;
  diasresto = diasresto.roundToDouble();

  int semanasEntero = semanas.toInt();
  int diasEntero = diasresto.toInt();

  DateTime fpp = fechainicio.add(const Duration(days: 280));

  String fechaPParto = DateFormat('dd-MM-yyyy').format(fpp);

  String semanasString;

  if (semanasEntero == 1) {
    semanasString = 'semana';
  } else {
    semanasString = 'semanas';
  }
  String diasString;

  if (diasEntero == 1) {
    diasString = 'día';
  } else {
    diasString = 'días';
  }

  String semanasYdia = '$semanasEntero $semanasString $diasEntero $diasString';

  double semanasRedon = semanas * 10;
  semanasRedon = semanasRedon.roundToDouble();
  semanasRedon = semanasRedon / 10;

  return [semanasRedon.toString(), dias.toString(), semanasYdia, fechaPParto];
}
