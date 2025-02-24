import 'dart:io';

// Función recursiva para calcular el factorial
int factorial(int n) {
  if (n == 0 || n == 1) {
    return 1;
  }
  return n * factorial(n - 1);
}

void main() {
  stdout.write("Ingrese un número: ");
  int? numero = int.tryParse(stdin.readLineSync()!);

  if (numero == null || numero < 0) {
    print("Por favor, ingrese un número entero no negativo.");
  } else {
    print("El factorial de $numero es: ${factorial(numero)}");
  }
}
