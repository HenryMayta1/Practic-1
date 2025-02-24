import 'dart:io';

// Función para contar vocales en una cadena
Map<String, int> contarVocales(String texto) {
  // Convertimos el texto a minúsculas para simplificar la comparación
  texto = texto.toLowerCase();

  // Definir un mapa para almacenar la cantidad de cada vocal
  Map<String, int> contador = {
    'a': 0,
    'e': 0,
    'i': 0,
    'o': 0,
    'u': 0,
  };

  // Iterar sobre cada caracter del texto
  for (var char in texto.runes) {
    String letra = String.fromCharCode(char);
    if (contador.containsKey(letra)) {
      contador[letra] = contador[letra]! + 1;
    }
  }

  return contador;
}

void main() {
  stdout.write("Ingrese una cadena de texto: ");
  String texto = stdin.readLineSync()!;

  // Obtener el conteo de vocales
  Map<String, int> resultado = contarVocales(texto);

  // Mostrar los resultados
  print("\nCantidad de vocales en el texto:");
  resultado.forEach((vocal, cantidad) {
    print("$vocal: $cantidad");
  });
}
