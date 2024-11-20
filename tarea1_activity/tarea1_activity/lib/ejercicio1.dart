import 'package:flutter/material.dart';

class EdadCalculator extends StatefulWidget {
  @override
  _EdadCalculatorState createState() => _EdadCalculatorState();
}

class _EdadCalculatorState extends State<EdadCalculator> {
  DateTime _selectedDate = DateTime.now();
  int _edad = 0;
  String _mensajeEdad = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _calcularEdad();
      });
    }
  }

  void _calcularEdad() {
    final now = DateTime.now();
    final diff = now.difference(_selectedDate).inDays;
    _edad = diff ~/ 365;

    // Validar que la edad esté entre 0 y 120 años
    if (_edad < 0 || _edad > 120) {
      _mensajeEdad = 'Edad no válida';
    } else {
      // Determinar el mensaje según el rango de edad
      if (_edad >= 0 && _edad <= 10) {
        _mensajeEdad = 'Niño';
      } else if (_edad > 10 && _edad <= 14) {
        _mensajeEdad = 'Pubertad';
      } else if (_edad > 14 && _edad <= 18) {
        _mensajeEdad = 'Adolescente';
      } else if (_edad > 18 && _edad <= 25) {
        _mensajeEdad = 'Joven';
      } else if (_edad > 25 && _edad <= 65) {
        _mensajeEdad = 'Adulto';
      } else if (_edad > 65) {
        _mensajeEdad = 'Anciano';
      }
    }
  }

  // Función para formatear la fecha sin usar `intl`
  String _formatearFecha(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Edad'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Fecha de Nacimiento:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              _formatearFecha(_selectedDate), // Usamos la función para mostrar la fecha
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Seleccionar Fecha'),
            ),
            SizedBox(height: 20),
            Text(
              'Edad: $_edad años',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              _mensajeEdad,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
