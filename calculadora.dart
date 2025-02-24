import 'dart:io';

void main() {
  while (true) {
    print("\n--- Calculadora Simple ---");
    stdout.write("Ingrese el primer número: ");
    double? num1 = double.tryParse(stdin.readLineSync()!);
    
    stdout.write("Ingrese el segundo número: ");
    double? num2 = double.tryParse(stdin.readLineSync()!);
    
    if (num1 == null || num2 == null) {
      print("Entrada inválida. Inténtelo de nuevo.");
      continue;
    }
    
    print("Seleccione una operación: +, -, *, / (o escriba 'salir' para terminar)");
    stdout.write("Operación: ");
    String operacion = stdin.readLineSync()!.trim();

    if (operacion.toLowerCase() == "salir") {
      print("Saliendo de la calculadora...");
      break;
    }

    double resultado;
    switch (operacion) {
      case '+':
        resultado = num1 + num2;
        print("Resultado: $num1 + $num2 = $resultado");
        break;
      case '-':
        resultado = num1 - num2;
        print("Resultado: $num1 - $num2 = $resultado");
        break;
      case '*':
        resultado = num1 * num2;
        print("Resultado: $num1 * $num2 = $resultado");
        break;
      case '/':
        if (num2 == 0) {
          print("Error: No se puede dividir por cero.");
        } else {
          resultado = num1 / num2;
          print("Resultado: $num1 / $num2 = $resultado");
        }
        break;
      default:
        print("Operación no válida. Intente nuevamente.");
    }
  }
}
