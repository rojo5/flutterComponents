import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  const HomePageTemp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes AppBar'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('ListTile 1'),
          ),
          Divider(),
          ListTile(
            title: Text('ListTile 2'),
          ),
          Divider(),
          ListTile(
            title: Text('ListTile 3'),
          )
        ],
      ),
    );
  }
}
