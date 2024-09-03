import 'package:calculadora/helloWorld.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: const Calculadora(),
      ),
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
      } else if (valor == 'Calcular') {
      } else {
        display += valor;
      }
    });
  }

  String calcular(String expressao) {
    List<String> partes = expressao.split(RegExp(r'(\+|\-|\*|\/)'));
    double n1 = double.parse(partes[0]);
    String op =
        expressao.replaceAll(RegExp(r'\d'), '').trim();
    double n2 = double.parse(partes[1]);

    switch (op) {
      case '+':
        return (n1 + n2).toString();
      case '-':
        return (n1 - n2).toString();
      case '*':
        return (n1 * n2).toString();
      case '/':
        return (n1 / n2).toString();
      default:
        return expressao;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora do Kayky'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerRight,
            child: Text(
              display,
              style: const TextStyle(fontSize: 24),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () => apertarBotao('7'),
                child: const Text('7'),
              ),
              ElevatedButton(
                onPressed: () => apertarBotao('8'),
                child: const Text('8'),
              ),
              ElevatedButton(
                onPressed: () => apertarBotao('9'),
                child: const Text('9'),
              ),
              ElevatedButton(
                onPressed: () => apertarBotao('/'),
                child: const Text('/'),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () => apertarBotao('4'),
                child: const Text('4'),
              ),
              ElevatedButton(
                onPressed: () => apertarBotao('5'),
                child: const Text('5'),
              ),
              ElevatedButton(
                onPressed: () => apertarBotao('6'),
                child: const Text('6'),
              ),
              ElevatedButton(
                onPressed: () => apertarBotao('*'),
                child: const Text('*'),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () => apertarBotao('1'),
                child: const Text('1'),
              ),
              ElevatedButton(
                onPressed: () => apertarBotao('2'),
                child: const Text('2'),
              ),
              ElevatedButton(
                onPressed: () => apertarBotao('3'),
                child: const Text('3'),
              ),
              ElevatedButton(
                onPressed: () => apertarBotao('-'),
                child: const Text('-'),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () => apertarBotao('0'),
                child: const Text('0'),
              ),
             
              ElevatedButton(
                onPressed: () => apertarBotao('C'),
                child: const Text('C'),
              ),
              ElevatedButton(
                onPressed: () => apertarBotao('+'),
                child: const Text('+'),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  
                  Navigator.pushNamed(context, '/hello');
                }, child: const Text('Calcular'),
              ),
              ElevatedButton(
                onPressed: () => apertarBotao('='),
                child: const Text(
                  '=',
                  style: TextStyle(color: Color.fromARGB(255, 255, 65, 59)),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Text('Para calcular clique no botão "=" ')
        ],
      ),
    );
  }
}
