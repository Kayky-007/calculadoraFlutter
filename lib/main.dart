import 'package:calculadora/helloWorld.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18, color: Colors.black54),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
            minimumSize: const Size(70, 70),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(fontSize: 20),
          ),
        ),
      ),
      home: const Calculadora(),
      routes: {
        '/hello': (context) => const Helloworld(),
      },
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => CalculadoraState();
}

class CalculadoraState extends State<Calculadora> {
  String display = '';

  void apertarBotao(String valor) {
    setState(() {
      if (valor == 'C') {
        display = '';
      } else if (valor == '=') {
        display = calcular(display);
      } else {
        display += valor;
      }
    });
  }

  String calcular(String expressao) {
    List<String> partes = expressao.split(RegExp(r'(\+|\-|\*|\/)'));
    double n1 = double.parse(partes[0]);
    String op = expressao.replaceAll(RegExp(r'\d'), '').trim();
    double n2 = double.parse(partes[1]);

    switch (op) {
      case '+':
        return (n1 + n2).toString();
      case '-':
        return (n1 - n2).toString();
      case '*':
        return (n1 * n2).toString();
      case '/':
        if (n2 == 0) {
          return '[Erro] Divisão por zero!';
        } else {
          return (n1 / n2).toString();
        }
      default:
        return expressao;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora do Kayky'),
        backgroundColor: Colors.blueGrey[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  display,
                  style: const TextStyle(
                    fontSize: 32,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('7'),
                _buildButton('8'),
                _buildButton('9'),
                _buildButton('/'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('4'),
                _buildButton('5'),
                _buildButton('6'),
                _buildButton('*'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('1'),
                _buildButton('2'),
                _buildButton('3'),
                _buildButton('-'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('0'),
                _buildButton('C', backgroundColor: Colors.redAccent),
                _buildButton('+'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/hello');
                  },
                  child: const Text('Calcular'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    minimumSize: const Size(150, 60),
                  ),
                ),
                _buildButton('=',
                    textColor: Colors.white, backgroundColor: Colors.green),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Para calcular clique no botão "="',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String label,
      {Color? backgroundColor, Color? textColor}) {
    return ElevatedButton(
      onPressed: () => apertarBotao(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.blueGrey,
        minimumSize: const Size(70, 70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 24,
          color: textColor ?? Colors.white,
        ),
      ),
    );
  }
}
