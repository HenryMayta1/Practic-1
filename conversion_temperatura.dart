import 'dart:io';

// Clase para conversión de temperatura
class Temperatura {
  double valor;

  // Constructor
  Temperatura(this.valor);

  // Método para convertir de Celsius a Fahrenheit
  double celsiusAFahrenheit() {
    return (valor * 9 / 5) + 32;
  }

  // Método para convertir de Fahrenheit a Celsius
  double fahrenheitACelsius() {
    return (valor - 32) * 5 / 9;
  }
}

void main() {
  stdout.write("Ingrese la temperatura: ");
  double? temperatura = double.tryParse(stdin.readLineSync()!);

  if (temperatura == null) {
    print("Entrada inválida. Debe ingresar un número.");
    return;
  }

  stdout.write("Seleccione la conversión (1: Celsius a Fahrenheit, 2: Fahrenheit a Celsius): ");
  int? opcion = int.tryParse(stdin.readLineSync()!);

  if (opcion == 1) {
    Temperatura temp = Temperatura(temperatura);
    print("${temperatura}°C equivale a ${temp.celsiusAFahrenheit()}°F");
  } else if (opcion == 2) {
    Temperatura temp = Temperatura(temperatura);
    print("${temperatura}°F equivale a ${temp.fahrenheitACelsius()}°C");
  } else {
    print("Opción inválida.");
  }
}
