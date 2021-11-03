
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
        ),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            _cardTipo1(),
            SizedBox(height: 30.0),
            _cardTipo2()
          ],
        ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0) ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Sot el titulo de esta tarjeta'),
            subtitle: Text(' que tal esta esun jnuo j j jv rj jvr o fivnsodvosdno sdh owdfon do sojd ojf  o jsojd do sod  '),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text('Cancelar'),
                onPressed: (){},
              ),
              TextButton(
                child: Text('OK'),
                onPressed: (){},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      // clipBehavior: Clip.antiAlias,
      child:  Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://cdna.artstation.com/p/assets/images/images/003/222/676/large/aleksandra-mokrzycka-1-2.jpg?1471286938'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover
            ),
          // Image(
          //   image: NetworkImage('https://cdna.artstation.com/p/assets/images/images/003/222/676/large/aleksandra-mokrzycka-1-2.jpg?1471286938'),
          // ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Toy chikito'))
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, -10.0)
          )
        ]
      ),
      child: ClipRRect(
         borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}