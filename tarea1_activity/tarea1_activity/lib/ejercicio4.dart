import 'package:flutter/material.dart';

class Ejercicio4Screen extends StatefulWidget {
  @override
  _Ejercicio4ScreenState createState() => _Ejercicio4ScreenState();
}

class _Ejercicio4ScreenState extends State<Ejercicio4Screen> {
  final TextEditingController consumoController = TextEditingController();
  String resultado = "";

  void calcularCosto() {
    int consumo = int.tryParse(consumoController.text) ?? 0;
    double total;

    if (consumo <= 50) {
      total = consumo * 30;
    } else if (consumo <= 100) {
      total = 50 * 30 + (consumo - 50) * 35;
    } else {
      total = 50 * 30 + 50 * 35 + (consumo - 100) * 42;
    }

    double totalConIVA = total + total * 0.16;

    setState(() {
      resultado = "Total a pagar con IVA: \$${totalConIVA.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejercicio 4: Cálculo eléctrico"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: consumoController,
              decoration: InputDecoration(labelText: "Ingrese consumo (KWH)"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularCosto,
              child: Text("Calcular"),
            ),
            SizedBox(height: 20),
            Text(
              resultado,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
