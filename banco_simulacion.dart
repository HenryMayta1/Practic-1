import 'dart:io';

// Clase base: Cuenta Bancaria
class CuentaBancaria {
  String titular;
  double balance;

  // Constructor
  CuentaBancaria(this.titular, this.balance);

  // Método para depositar dinero
  void depositar(double monto) {
    if (monto > 0) {
      balance += monto;
      print("Depósito exitoso. Nuevo balance: \$${balance.toStringAsFixed(2)}");
    } else {
      print("Error: El monto a depositar debe ser mayor a 0.");
    }
  }

  // Método para retirar dinero
  void retirar(double monto) {
    if (monto > 0 && monto <= balance) {
      balance -= monto;
      print("Retiro exitoso. Nuevo balance: \$${balance.toStringAsFixed(2)}");
    } else if (monto <= 0) {
      print("Error: El monto debe ser mayor a 0.");
    } else {
      print("Error: Fondos insuficientes.");
    }
  }

  // Método para mostrar el balance
  void mostrarBalance() {
    print("Cuenta de $titular - Balance actual: \$${balance.toStringAsFixed(2)}");
  }
}

// Subclase: Cuenta de Ahorros con interés anual
class CuentaDeAhorros extends CuentaBancaria {
  double tasaInteres; // en porcentaje

  // Constructor
  CuentaDeAhorros(String titular, double balance, this.tasaInteres)
      : super(titular, balance);

  // Método para aplicar interés anual
  void aplicarInteres() {
    if (balance > 0) {
      double interes = (balance * tasaInteres) / 100;
      balance += interes;
      print("Interés aplicado (\$${interes.toStringAsFixed(2)}). Nuevo balance: \$${balance.toStringAsFixed(2)}");
    } else {
      print("Error: No se puede aplicar interés a una cuenta con saldo 0 o negativo.");
    }
  }
}

void main() {
  stdout.write("Ingrese el nombre del titular: ");
  String titular = stdin.readLineSync()!;

  stdout.write("Ingrese el saldo inicial: ");
  double? saldoInicial = double.tryParse(stdin.readLineSync()!);

  if (saldoInicial == null || saldoInicial < 0) {
    print("Error: Saldo inicial inválido.");
    return;
  }

  stdout.write("Seleccione el tipo de cuenta (1: Cuenta Bancaria, 2: Cuenta de Ahorros): ");
  int? tipoCuenta = int.tryParse(stdin.readLineSync()!);

  if (tipoCuenta == 1) {
    CuentaBancaria cuenta = CuentaBancaria(titular, saldoInicial);
    manejarCuenta(cuenta);
  } else if (tipoCuenta == 2) {
    stdout.write("Ingrese la tasa de interés anual (%): ");
    double? tasaInteres = double.tryParse(stdin.readLineSync()!);

    if (tasaInteres == null || tasaInteres < 0) {
      print("Error: Tasa de interés inválida.");
      return;
    }

    CuentaDeAhorros cuentaAhorro = CuentaDeAhorros(titular, saldoInicial, tasaInteres);
    manejarCuentaAhorro(cuentaAhorro);
  } else {
    print("Error: Opción inválida.");
  }
}

void manejarCuenta(CuentaBancaria cuenta) {
  while (true) {
    print("\nSeleccione una operación:");
    print("1. Depositar");
    print("2. Retirar");
    print("3. Mostrar balance");
    print("4. Salir");
    
    stdout.write("Opción: ");
    int? opcion = int.tryParse(stdin.readLineSync()!);

    if (opcion == 1) {
      stdout.write("Ingrese el monto a depositar: ");
      double? monto = double.tryParse(stdin.readLineSync()!);
      if (monto != null) cuenta.depositar(monto);
    } else if (opcion == 2) {
      stdout.write("Ingrese el monto a retirar: ");
      double? monto = double.tryParse(stdin.readLineSync()!);
      if (monto != null) cuenta.retirar(monto);
    } else if (opcion == 3) {
      cuenta.mostrarBalance();
    } else if (opcion == 4) {
      print("Saliendo del sistema...");
      break;
    } else {
      print("Error: Opción inválida.");
    }
  }
}

void manejarCuentaAhorro(CuentaDeAhorros cuenta) {
  while (true) {
    print("\nSeleccione una operación:");
    print("1. Depositar");
    print("2. Retirar");
    print("3. Aplicar interés");
    print("4. Mostrar balance");
    print("5. Salir");

    stdout.write("Opción: ");
    int? opcion = int.tryParse(stdin.readLineSync()!);

    if (opcion == 1) {
      stdout.write("Ingrese el monto a depositar: ");
      double? monto = double.tryParse(stdin.readLineSync()!);
      if (monto != null) cuenta.depositar(monto);
    } else if (opcion == 2) {
      stdout.write("Ingrese el monto a retirar: ");
      double? monto = double.tryParse(stdin.readLineSync()!);
      if (monto != null) cuenta.retirar(monto);
    } else if (opcion == 3) {
      cuenta.aplicarInteres();
    } else if (opcion == 4) {
      cuenta.mostrarBalance();
    } else if (opcion == 5) {
      print("Saliendo del sistema...");
      break;
    } else {
      print("Error: Opción inválida.");
    }
  }
}
