import 'package:flutter/material.dart';

class Helloworld extends StatefulWidget {
  const Helloworld({super.key});

  @override
  State<Helloworld> createState() => _HelloworldState();
}

class _HelloworldState extends State<Helloworld> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Hello World!'),
    );
  }
}