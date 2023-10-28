import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xff0366fc),
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light),
        title: const Text(
          'Hello, world!',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Text('Hello, world!'),
      ),
    );
  }
}
