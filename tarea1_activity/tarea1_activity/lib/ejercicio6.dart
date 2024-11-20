import 'package:flutter/material.dart';

class Ejercicio6Screen extends StatefulWidget {
  @override
  _Ejercicio6ScreenState createState() => _Ejercicio6ScreenState();
}

class _Ejercicio6ScreenState extends State<Ejercicio6Screen> {
  // Controladores para ingresar la cantidad de cada tipo de árbol
  final TextEditingController paltosController = TextEditingController();
  final TextEditingController limonesController = TextEditingController();
  final TextEditingController chirimoyasController = TextEditingController();

  String resultado = "";

  // Función para calcular el precio total
  void calcularPrecio() {
    // Precios unitarios
    const double precioPaltos = 1200.0;
    const double precioLimones = 1000.0;
    const double precioChirimoyas = 980.0;

    // Obtener las cantidades ingresadas
    int paltos = int.tryParse(paltosController.text) ?? 0;
    int limones = int.tryParse(limonesController.text) ?? 0;
    int chirimoyas = int.tryParse(chirimoyasController.text) ?? 0;

    // Calcular precios individuales antes de aplicar descuentos
    double totalPaltos = paltos * precioPaltos;
    double totalLimones = limones * precioLimones;
    double totalChirimoyas = chirimoyas * precioChirimoyas;

    // Aplicar descuentos según la cantidad de cada tipo de árbol
    if (paltos > 100 && paltos <= 300) {
      totalPaltos *= 0.90; // 10% de descuento
    } else if (paltos > 300) {
      totalPaltos *= 0.82; // 18% de descuento
    }

    if (limones > 100 && limones <= 300) {
      totalLimones *= 0.875; // 12.5% de descuento
    } else if (limones > 300) {
      totalLimones *= 0.80; // 20% de descuento
    }

    if (chirimoyas > 100 && chirimoyas <= 300) {
      totalChirimoyas *= 0.855; // 14.5% de descuento
    } else if (chirimoyas > 300) {
      totalChirimoyas *= 0.81; // 19% de descuento
    }

    // Calcular el total de todos los árboles
    double totalCompra = totalPaltos + totalLimones + totalChirimoyas;

    // Aplicar descuento adicional por más de 1000 árboles
    int totalArboles = paltos + limones + chirimoyas;
    if (totalArboles > 1000) {
      totalCompra *= 0.85; // 15% de descuento adicional
    }

    // Calcular el total con IVA
    double totalConIVA = totalCompra * 1.16; // IVA del 16%

    // Mostrar el resultado
    setState(() {
      resultado = "Total a pagar (con IVA): \$${totalConIVA.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejercicio 6: Cálculo de árboles"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: paltosController,
              decoration: InputDecoration(labelText: "Cantidad de Paltos"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: limonesController,
              decoration: InputDecoration(labelText: "Cantidad de Limones"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: chirimoyasController,
              decoration: InputDecoration(labelText: "Cantidad de Chirimoyas"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularPrecio,
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
