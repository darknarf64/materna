import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final listado = [
    'Edad Gestacional x FUR',
    'IMC pregestacional',
    'Peso pregestacional estimado',
    'Edad gestacional x ECO',
    'Evaluación Nutricional',
    'Ganancia de peso',
    'Parámetros Ecográficos',
    'Evaluación según altura uterina',
    'Recomendaciones de Ganancia de Peso',
    'Bibliorafía'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.home),
      ),
      body: _buildListView(),
    );
  }

  ListView _buildListView() {
    return ListView(
      children: _crearListaCorta(),
    );
  }

  // List<Widget> _crearListado() {
  //   List<Widget> lista = [];

  //   for (String item in listado) {
  //     final temWidget = ListTile(
  //       title: Text(item),
  //     );
  //     lista..add(temWidget)..add(Divider());
  //   }

  //   return lista;
  // }

  List<Widget> _crearListaCorta() {
    var widget = listado.map((e) {
      return Column(
        children: [
          ListTile(
            title: Text(e),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();

    return widget;
  }
}
