import 'package:flutter/material.dart';

class CalculadoraCamisas extends StatefulWidget {
  @override
  _CalculadoraCamisasState createState() => _CalculadoraCamisasState();
}

class _CalculadoraCamisasState extends State<CalculadoraCamisas> {
  TextEditingController _precioController = TextEditingController();
  TextEditingController _cantidadController = TextEditingController();
  double _precioTotal = 0.0;
  double _descuento = 0.0;

  void _calcularPrecio() {
    double precioCamisa = double.tryParse(_precioController.text) ?? 0.0;
    int cantidadCamisas = int.tryParse(_cantidadController.text) ?? 0;

    if (precioCamisa <= 0 || cantidadCamisas <= 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Por favor, ingrese valores positivos para el precio y la cantidad.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Aceptar'),
              ),
            ],
          );
        },
      );
      return;
    }

    _precioTotal = precioCamisa * cantidadCamisas;

    if (cantidadCamisas >= 5) {
      _descuento = 0.2; // 20% de descuento
    } else if (cantidadCamisas >= 3) {
      _descuento = 0.15; // 15% de descuento
    } else {
      _descuento = 0.1; // 10% de descuento
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Camisas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _precioController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Precio por camisa'),
            ),
            TextField(
              controller: _cantidadController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Cantidad de camisas'),
            ),
            ElevatedButton(
              onPressed: _calcularPrecio,
              child: Text('Calcular'),
            ),
            SizedBox(height: 20),
            Text(
              'Precio total: \$${_precioTotal.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Descuento: \$${(_precioTotal * _descuento).toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
