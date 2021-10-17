import 'package:flutter/material.dart';
import 'package:flutter_componentes/src/pages/home_page_temp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes APP',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Componentes'),
        ),
        body: HomePageTemp()
      ),
    );
  }
}