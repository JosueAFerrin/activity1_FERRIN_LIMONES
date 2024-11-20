import 'package:flutter/material.dart';

class Ejercicio3Screen extends StatefulWidget {
  @override
  _Ejercicio3ScreenState createState() => _Ejercicio3ScreenState();
}

class _Ejercicio3ScreenState extends State<Ejercicio3Screen> {
  final TextEditingController aController = TextEditingController();
  final TextEditingController bController = TextEditingController();
  final TextEditingController cController = TextEditingController();
  String resultado = "";

  void verificarTernaPitagorica() {
    int a = int.tryParse(aController.text) ?? 0;
    int b = int.tryParse(bController.text) ?? 0;
    int c = int.tryParse(cController.text) ?? 0;

    if ((a * a + b * b == c * c) || (a * a + c * c == b * b) || (b * b + c * c == a * a)) {
      setState(() {
        resultado = "Es una terna pitagórica.";
      });
    } else {
      setState(() {
        resultado = "No es una terna pitagórica.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejercicio 3: Terna Pitagórica"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: aController,
              decoration: InputDecoration(labelText: "Ingrese a"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: bController,
              decoration: InputDecoration(labelText: "Ingrese b"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: cController,
              decoration: InputDecoration(labelText: "Ingrese c"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: verificarTernaPitagorica,
              child: Text("Verificar"),
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
