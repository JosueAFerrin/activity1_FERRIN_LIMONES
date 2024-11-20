import 'package:flutter/material.dart';
import 'ejercicio1.dart';
import 'ejercicio2.dart';
import 'ejercicio3.dart';
import 'ejercicio4.dart';
import 'ejercicio5.dart';
import 'ejercicio6.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejercicios Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PantallaInicio(), // Pantalla de inicio antes del menú
    );
  }
}

class PantallaInicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Imagen de inicio
            Image.asset('assets/imgs/inicio.png', width: 300, height: 300),
            SizedBox(height: 20),
            // Botón Comenzar
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuPrincipal()),
                );
              },
              child: Text('Comenzar', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú Principal'),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EdadCalculator()),
                );
              },
              child: Text('Ejercicio 1: Calculadora de Edad'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculadoraCamisas()),
                );
              },
              child: Text('Ejercicio 2: Calculadora de Camisas'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ejercicio3Screen()),
                );
              },
              child: Text('Ejercicio 3: Operaciones Aritméticas'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ejercicio4Screen()),
                );
              },
              child: Text('Ejercicio 4: Calculadora de elergía'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculadoraSueldoVendedor()),
                );
              },
              child: Text('Ejercicio 5: Sueldo de Vendedor'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ejercicio6Screen()),
                );
              },
              child: Text('Ejercicio 6: Compra de Árboles'),
            ),
          ],
        ),
      ),
    );
  }
}
