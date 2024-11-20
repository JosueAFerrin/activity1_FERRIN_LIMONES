import 'package:flutter/material.dart';

class CalculadoraSueldoVendedor extends StatefulWidget {
  @override
  _CalculadoraSueldoVendedorState createState() => _CalculadoraSueldoVendedorState();
}

class _CalculadoraSueldoVendedorState extends State<CalculadoraSueldoVendedor> {
  final TextEditingController _sueldoBaseController = TextEditingController();
  final TextEditingController _ventasController = TextEditingController();
  double _sueldoTotal = 0.0;

  void calcularSueldo() {
    double sueldoBase = double.tryParse(_sueldoBaseController.text) ?? 0.0;
    double ventas = double.tryParse(_ventasController.text) ?? 0.0;

    if (sueldoBase <= 0 || ventas < 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Por favor, ingrese valores positivos para el sueldo base y las ventas.'),
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

    double comision;
    if (ventas < 4000000) {
      comision = 0;
    } else if (ventas < 10000000) {
      comision = ventas * 0.03;
    } else {
      comision = ventas * 0.07;
    }

    _sueldoTotal = sueldoBase + comision;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Sueldo de Vendedor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _sueldoBaseController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Sueldo base'),
            ),
            TextField(
              controller: _ventasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ventas totales'),
            ),
            ElevatedButton(
              onPressed: calcularSueldo,
              child: Text('Calcular Sueldo'),
            ),
            SizedBox(height: 20),
            Text(
              'Sueldo total: \$${_sueldoTotal.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
