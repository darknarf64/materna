import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:materna/page/altura_uterina.dart';
import 'package:materna/page/biblio.dart';
import 'package:materna/page/cuadro_recomen_peso.dart';

import 'package:materna/page/edad_gest_fur.dart';
import 'package:materna/page/edad_gest_por_eco.dart';
import 'package:materna/page/estado_imc_pregest.dart';
import 'package:materna/page/evaluacion_nutri_total.dart';
import 'package:materna/page/evaluacion_peso_ganad_semana.dart';
import 'package:materna/page/home_page.dart';
import 'package:flutter/services.dart';
import 'package:materna/page/perimetos_eco_peso.dart';
import 'package:materna/page/peso_estimado.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      title: 'Materna',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English, no country code
        const Locale('es', 'ES'), // Spanish, no country code
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'edadgestFUR': (BuildContext context) => Edadgestacionalfur(),
        'enutIMCPreG': (BuildContext context) => Enutpregestacional(),
        'pesoEstimado': (BuildContext context) => Pesoestimado(),
        'edadgestEco': (BuildContext context) => EdadSegunEcografia(),
        'evaluacionNutricional': (BuildContext context) =>
            EvaluacionNutricionalTotal(),
        'gananciapesosemana': (BuildContext context) => GananciaPesoPorSemana(),
        'parametrosEcograficos': (BuildContext context) =>
            ParametrosEcograficos(),
        'alturaUterina': (BuildContext context) => ALturaUterina(),
        'cuadroRecomendaciones': (BuildContext context) =>
            CuadroRecomendaciones(),
        'biblio': (BuildContext context) => Bibliografia(),
      },
    );
  }
}
