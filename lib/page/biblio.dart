import 'package:flutter/material.dart';
import 'package:materna/widgets/page_background.dart';
import 'package:materna/widgets/textos_encabezado.dart';
import 'package:materna/widgets/titulos_appbar_page.dart';

class Bibliografia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff800040),
          title: TituloAppBar(text: 'Bibliografía', icon: Icons.library_books),
        ),
        body: Stack(
          children: [
            PageBackground(
              colorprimario: Colors.lightGreen,
              colorsecunadrio: Colors.green.shade700,
            ),
            _crearListado(context)
          ],
        ));
  }

  // Ministerio de Salud (2019). Guía Técnica para la valoración nutricional antropométrica de la Gestante (resolución Ministerial N° 325-2019/MINSA). Lima, Perú.

  Widget _crearListado(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          TextoEncabezado(
            text: 'Bibliografía',
          ),
          Divider(),
          _crearTextoImagen(
              'Clasificación del estado nutricional de la gestante según el IMC Pregestacional'),
          _crearImagen('assets/image/imc_pregestacional.jpg'),
          Divider(),
          _crearTextoImagen('Recomendaciones de Ganancia de Peso'),
          _crearImagen('assets/image/recomendaciones_ganancia_peso.jpg'),
          Divider(),
          Text('Bibliografía consultada: '),
          SizedBox(
            height: 5.0,
          ),
          Text(
              'Ministerio de Salud (2019). Guía Técnica para la valoración nutricional antropométrica de la Gestante (resolución Ministerial N° 325-2019/MINSA). Lima, Perú.')

          // _listadeResultados()
        ],
      ),
    );
  }

  Center _crearTextoImagen(String titulo) {
    return Center(
      child: Text(
        titulo,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _crearImagen(String ruta) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Image(image: AssetImage(ruta)),
    );
  }
}
