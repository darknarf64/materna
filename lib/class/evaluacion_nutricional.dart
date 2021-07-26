class EvaluacionNutricional {
  Map<int, List<double>> gestanteBajoPeso = {
    1: [0, 0.1],
    2: [0, 0.3],
    3: [0.1, 0.4],
    4: [0.1, 0.6],
    5: [0.1, 0.7],
    6: [0.2, 0.9],
    7: [0.2, 1],
    8: [0.3, 1.2],
    9: [0.3, 1.3],
    10: [0.3, 1.5],
    11: [0.4, 1.6],
    12: [0.4, 1.8],
    13: [0.5, 2],
    14: [0.9, 2.5],
    15: [1.3, 3.1],
    16: [1.8, 3.7],
    17: [2.2, 4.3],
    18: [2.7, 4.9],
    19: [3.1, 5.5],
    20: [3.6, 6.1],
    21: [4, 6.7],
    22: [4.4, 7.3],
    23: [4.9, 7.9],
    24: [5.3, 8.5],
    25: [5.8, 9.1],
    26: [6.2, 9.7],
    27: [6.7, 10.2],
    28: [7.1, 10.8],
    29: [7.6, 11.4],
    30: [8, 12],
    31: [8.4, 12.6],
    32: [8.9, 13.2],
    33: [9.3, 13.8],
    34: [9.8, 14.4],
    35: [10.2, 15],
    36: [10.7, 15.6],
    37: [11.1, 16.2],
    38: [11.6, 16.8],
    39: [12, 17.4],
    40: [12.5, 18],
  };

  Map<int, List<double>> gestanteNormoPesoUnico = {
    1: [0, 0.1],
    2: [0, 0.3],
    3: [0.1, 0.4],
    4: [0.1, 0.6],
    5: [0.1, 0.7],
    6: [0.2, 0.9],
    7: [0.2, 1],
    8: [0.3, 1.2],
    9: [0.3, 1.3],
    10: [0.3, 1.5],
    11: [0.4, 1.6],
    12: [0.4, 1.8],
    13: [0.5, 2],
    14: [0.9, 2.5],
    15: [1.3, 3],
    16: [1.7, 3.5],
    17: [2.1, 4],
    18: [2.5, 4.5],
    19: [2.9, 5.1],
    20: [3.3, 5.6],
    21: [3.7, 6.1],
    22: [4.1, 6.6],
    23: [4.5, 7.1],
    24: [4.9, 7.7],
    25: [5.3, 8.2],
    26: [5.7, 8.7],
    27: [6.2, 9.2],
    28: [6.6, 9.7],
    29: [7, 10.2],
    30: [7.4, 10.8],
    31: [7.8, 11.3],
    32: [8.2, 11.8],
    33: [8.6, 12.3],
    34: [9, 12.8],
    35: [9.4, 13.4],
    36: [9.8, 13.9],
    37: [10.2, 14.4],
    38: [10.6, 14.9],
    39: [11, 15.4],
    40: [11.5, 16],
  };

  Map<int, List<double>> gestanteNormoPesoDoble = {
    1: [0, 0.1],
    2: [0, 0.3],
    3: [0.1, 0.4],
    4: [0.1, 0.6],
    5: [0.1, 0.7],
    6: [0.2, 0.9],
    7: [0.2, 1],
    8: [0.3, 1.2],
    9: [0.3, 1.3],
    10: [0.3, 1.5],
    11: [0.4, 1.6],
    12: [0.4, 1.8],
    13: [0.5, 2],
    14: [1.1, 2.8],
    15: [1.7, 3.7],
    16: [2.3, 4.5],
    17: [2.9, 5.4],
    18: [3.5, 6.2],
    19: [4.1, 7.1],
    20: [4.7, 7.9],
    21: [5.3, 8.8],
    22: [6, 9.6],
    23: [6.6, 10.5],
    24: [7.2, 11.3],
    25: [7.8, 12.2],
    26: [8.4, 13],
    27: [9, 13.9],
    28: [9.6, 14.7],
    29: [10.2, 15.6],
    30: [10.8, 16.4],
    31: [11.5, 17.3],
    32: [12.1, 18.1],
    33: [12.7, 19],
    34: [13.3, 19.8],
    35: [13.9, 20.7],
    36: [14.5, 21.5],
    37: [15.1, 22.4],
    38: [15.7, 23.2],
    39: [16.3, 24.1],
    40: [17, 25],
  };

  Map<int, List<double>> gestanteSobrePesoUnico = {
    1: [0, 0.1],
    2: [0, 0.3],
    3: [0.1, 0.4],
    4: [0.1, 0.6],
    5: [0.1, 0.7],
    6: [0.2, 0.9],
    7: [0.2, 1],
    8: [0.3, 1.2],
    9: [0.3, 1.3],
    10: [0.3, 1.5],
    11: [0.4, 1.6],
    12: [0.4, 1.8],
    13: [0.5, 2],
    14: [0.7, 2.3],
    15: [0.9, 2.7],
    16: [1.2, 3],
    17: [1.4, 3.4],
    18: [1.7, 3.7],
    19: [1.9, 4.1],
    20: [2.1, 4.4],
    21: [2.4, 4.8],
    22: [2.6, 5.1],
    23: [2.9, 5.5],
    24: [3.1, 5.8],
    25: [3.3, 6.2],
    26: [3.6, 6.5],
    27: [3.8, 6.9],
    28: [4.1, 7.2],
    29: [4.3, 7.6],
    30: [4.5, 7.9],
    31: [4.8, 8.3],
    32: [5, 8.6],
    33: [5.3, 9],
    34: [5.5, 9.3],
    35: [5.7, 9.7],
    36: [6, 10],
    37: [6.2, 10.4],
    38: [6.5, 10.7],
    39: [6.7, 11.1],
    40: [7, 11.5],
  };

  Map<int, List<double>> gestanteSobrePesoDoble = {
    1: [0, 0.1],
    2: [0, 0.3],
    3: [0.1, 0.4],
    4: [0.1, 0.6],
    5: [0.1, 0.7],
    6: [0.2, 0.9],
    7: [0.2, 1],
    8: [0.3, 1.2],
    9: [0.3, 1.3],
    10: [0.3, 1.5],
    11: [0.4, 1.6],
    12: [0.4, 1.8],
    13: [0.5, 2],
    14: [1, 2.7],
    15: [1.5, 3.5],
    16: [2, 4.3],
    17: [2.5, 5.1],
    18: [3, 5.8],
    19: [3.5, 6.6],
    20: [4, 7.4],
    21: [4.5, 8.2],
    22: [5, 9],
    23: [5.5, 9.7],
    24: [6, 10.5],
    25: [6.5, 11.3],
    26: [7, 12.1],
    27: [7.5, 12.8],
    28: [8, 13.6],
    29: [8.5, 14.4],
    30: [9, 15.2],
    31: [9.5, 16],
    32: [10, 16.7],
    33: [10.5, 17.5],
    34: [11, 18.3],
    35: [11.5, 19.1],
    36: [12, 19.8],
    37: [12.5, 20.6],
    38: [13, 21.4],
    39: [13.5, 22.2],
    40: [14, 23],
  };

  Map<int, List<double>> gestanteObesidadUnico = {
    1: [0, 0.1],
    2: [0, 0.3],
    3: [0.1, 0.4],
    4: [0.1, 0.6],
    5: [0.1, 0.7],
    6: [0.2, 0.9],
    7: [0.2, 1],
    8: [0.3, 1.2],
    9: [0.3, 1.3],
    10: [0.3, 1.5],
    11: [0.4, 1.6],
    12: [0.4, 1.8],
    13: [0.5, 2],
    14: [0.6, 2.2],
    15: [0.8, 2.5],
    16: [1, 2.7],
    17: [1.1, 3],
    18: [1.3, 3.2],
    19: [1.5, 3.5],
    20: [1.6, 3.8],
    21: [1.8, 4],
    22: [2, 4.3],
    23: [2.1, 4.5],
    24: [2.3, 4.8],
    25: [2.5, 5.1],
    26: [2.6, 5.3],
    27: [2.8, 5.6],
    28: [3, 5.8],
    29: [3.1, 6.1],
    30: [3.3, 6.4],
    31: [3.5, 6.6],
    32: [3.6, 6.9],
    33: [3.8, 7.1],
    34: [4, 7.4],
    35: [4.1, 7.7],
    36: [4.3, 7.9],
    37: [4.5, 8.2],
    38: [4.6, 8.4],
    39: [4.8, 8.7],
    40: [5, 9],
  };

  Map<int, List<double>> gestanteObesidadDoble = {
    1: [0, 0.1],
    2: [0, 0.3],
    3: [0.1, 0.4],
    4: [0.1, 0.6],
    5: [0.1, 0.7],
    6: [0.2, 0.9],
    7: [0.2, 1],
    8: [0.3, 1.2],
    9: [0.3, 1.3],
    10: [0.3, 1.5],
    11: [0.4, 1.6],
    12: [0.4, 1.8],
    13: [0.5, 2],
    14: [0.8, 2.6],
    15: [1.2, 3.2],
    16: [1.6, 3.8],
    17: [2, 4.5],
    18: [2.4, 5.1],
    19: [2.8, 5.7],
    20: [3.2, 6.4],
    21: [3.6, 7],
    22: [4, 7.6],
    23: [4.3, 8.2],
    24: [4.7, 8.9],
    25: [5.1, 9.5],
    26: [5.5, 10.1],
    27: [5.9, 10.8],
    28: [6.3, 11.4],
    29: [6.7, 12],
    30: [7.1, 12.7],
    31: [7.5, 13.3],
    32: [7.8, 13.9],
    33: [8.2, 14.5],
    34: [8.6, 15.2],
    35: [9, 15.8],
    36: [9.4, 16.4],
    37: [9.8, 17.1],
    38: [10.2, 17.7],
    39: [10.6, 18.3],
    40: [11, 19],
  };

  Map<int, List<double>> alturaUterina = {
    13: [8, 12],
    14: [9, 14],
    15: [10, 15],
    16: [12, 17],
    17: [13, 18],
    18: [14, 19],
    19: [14, 20],
    20: [15, 21],
    21: [16, 22],
    22: [17, 23],
    23: [18, 23],
    24: [19, 24],
    25: [20, 25],
    26: [20, 26],
    27: [21, 27],
    28: [22, 27],
    29: [23, 28],
    30: [24, 29],
    31: [24, 30],
    32: [25, 30],
    33: [26, 31],
    34: [26, 32],
    35: [27, 33],
    36: [28, 33],
    37: [29, 34],
    38: [30, 34],
    39: [31, 35],
    40: [31, 35]
  };

//Encontrar el peso según semana gestacional y estado nutricional pregestacional
  List<double> findPesoSemana(
      String estadoNutricional, String semana, String dias, int emultiple) {
    int semanaint = int.parse(semana);
    int diasInt = int.parse(dias);
    int buscarSemana;
    if (diasInt < 4) {
      buscarSemana = semanaint;
    } else {
      buscarSemana = semanaint + 1;
    }

    if (buscarSemana > 40) {
      buscarSemana = 40;
    }

    List<double> resultado;

    if (emultiple == 1) {
      switch (estadoNutricional) {
        case "Bajo peso":
          {
            resultado = gestanteBajoPeso[buscarSemana]!;
          }
          break;

        case "Normal":
          {
            resultado = gestanteNormoPesoUnico[buscarSemana]!;
          }
          break;
        case "Sobrepeso":
          {
            resultado = gestanteSobrePesoUnico[buscarSemana]!;
          }
          break;
        case "Obesidad":
          {
            resultado = gestanteObesidadUnico[buscarSemana]!;
          }
          break;

        default:
          resultado = [];
      }
      return resultado;
    } else {
      switch (estadoNutricional) {
        case "Bajo peso":
          {
            resultado = gestanteBajoPeso[buscarSemana]!;
          }
          break;

        case "Normal":
          {
            resultado = gestanteNormoPesoDoble[buscarSemana]!;
          }
          break;
        case "Sobrepeso":
          {
            resultado = gestanteSobrePesoDoble[buscarSemana]!;
          }
          break;
        case "Obesidad":
          {
            resultado = gestanteObesidadDoble[buscarSemana]!;
          }
          break;

        default:
          resultado = [];
      }
      return resultado;
    }
  }

//calcular imc
  double calcularIMC(String pesoST, String tallaST) {
    double peso = double.parse(pesoST);
    double talla = double.parse(tallaST);
    talla = talla / 100;
    double tallaCuadrado = talla * talla;
    double imc = peso / tallaCuadrado;
    imc = imc * 10;
    imc = (imc.roundToDouble()) / 10;
    return imc;
  }

//Calcula el estado nutricional según imc
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

  //estado nutricional segun ganancia de peso total entre el pregestacional y el peso actual
  String estadoDeGananciaDePeso(String pesoActual, String pesoPreGest,
      double pesominimo, double pesomaximo) {
    String _resultados;
    double _pesoActual = double.parse(pesoActual);
    double _pesoPregest = double.parse(pesoPreGest);
    double diferenciaPesos = _pesoActual - _pesoPregest;
    if (diferenciaPesos < pesominimo) {
      _resultados = 'O261: Aumento pequeño de peso en el embarazo';
    } else {
      if (diferenciaPesos > pesomaximo) {
        _resultados = 'O260: Aumento excesivo de peso en el embarazo';
      } else {
        _resultados = 'Ganancia adecuada de peso en el embarazo';
      }
    }
    return _resultados;
  }

//diferencia entre peso actual y pregestacional
  double diferenciaDePesos(String pesoActual, String pesoPreGest) {
    double _pesoActual = double.parse(pesoActual);
    double _pesoPregest = double.parse(pesoPreGest);
    double diferenciaPesos = _pesoActual - _pesoPregest;
    diferenciaPesos = diferenciaPesos * 10;
    diferenciaPesos = (diferenciaPesos.roundToDouble()) / 10;
    return diferenciaPesos;
  }

  //compara el peso por semana en un rango de semanas
  String compararGananciaPorSemana(double pesoxSemana, String estadoNutPreg) {
    String _estado = estadoNutPreg;
    String _resultado;

// bp 0.44	0.58
// n 0.35	0.5
// sp 0.23	0.33
// ob 0.17	0.27

    switch (_estado) {
      case 'Bajo peso':
        {
          if (pesoxSemana < 0.44) {
            _resultado = 'O261: Aumento pequeño de peso en el embarazo';
          } else {
            if (pesoxSemana > 0.58) {
              _resultado = 'O260: Aumento excesivo de peso en el embarazo';
            } else {
              _resultado = 'Ganancia adecuada de peso en el embarazo';
            }
          }
        }

        break;

      case 'Normal':
        {
          if (pesoxSemana < 0.35) {
            _resultado = 'O261: Aumento pequeño de peso en el embarazo';
          } else {
            if (pesoxSemana > 0.50) {
              _resultado = 'O260: Aumento excesivo de peso en el embarazo';
            } else {
              _resultado = 'Ganancia adecuada de peso en el embarazo';
            }
          }
        }

        break;

      case 'Sobrepeso':
        {
          if (pesoxSemana < 0.23) {
            _resultado = 'O261: Aumento pequeño de peso en el embarazo';
          } else {
            if (pesoxSemana > 0.33) {
              _resultado = 'O260: Aumento excesivo de peso en el embarazo';
            } else {
              _resultado = 'Ganancia adecuada de peso en el embarazo';
            }
          }
        }

        break;

      case 'Obesidad':
        {
          if (pesoxSemana < 0.17) {
            _resultado = 'O261: Aumento pequeño de peso en el embarazo';
          } else {
            if (pesoxSemana > 0.27) {
              _resultado = 'O260: Aumento excesivo de peso en el embarazo';
            } else {
              _resultado = 'Ganancia adecuada de peso en el embarazo';
            }
          }
        }

        break;

      default:
        {
          _resultado = '';
        }
    }
    return _resultado;
  }

  // Encuentra el valor p10 u p90 de altura uterina según edad gestacional
  List<double> encontrarAlturaUterina(int semana) {
    int sem = semana;
    List<double> resultado = alturaUterina[sem]!;
    return resultado;
  }
//compara la altura uterina con la altura uterina min y max

  String compararAlturaUterina(double alturaUterina, double min, double max) {
    String resultado;
    if (alturaUterina < min) {
      resultado =
          'Valor anormal para la edad gestacional (bajo el percentil 10)';
    } else {
      if (alturaUterina > max) {
        resultado =
            'Valor anormal para la edad gestacional (excede al percentil 90)';
      } else {
        resultado = 'Valor normal para la edad gestacional';
      }
    }
    return resultado;
  }
}
