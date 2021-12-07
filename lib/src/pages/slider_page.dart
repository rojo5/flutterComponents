 import 'package:flutter/material.dart';

 class SliderPage  extends StatefulWidget {
   SliderPage({Key? key}) : super(key: key);
 
   @override
   _SliderPageState createState() => _SliderPageState();
 }
 
 class _SliderPageState extends State<SliderPage> {

   double _valorSlider = 100.0;
   bool _bloquearCheck = false;

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: const Text('Slider '),
       ),
       body: Container(
         padding: const EdgeInsets.only(top: 50.0),
         child: Column(
           children: [
             _crearSlider(),
             _crearCheckBox(),
             _crearSwitch(),
             Expanded(child: _crearImagen())
           ],
         ),
       ),
     );
   }

 Widget _crearSlider() {
    
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      // divisions: 20,  
      value: _valorSlider,
      min: 10.0,
      max: 400.0, 
      onChanged: (_bloquearCheck) ? null : (double  valor) {
        setState(() {
          _valorSlider = valor;
        });
      }
    );
 }

  Widget _crearImagen() {

    return Image(
      image: const NetworkImage('https://www.cinemascomics.com/wp-content/uploads/2020/12/BABY-YODA.jpg?mrf-size=m'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckBox() {
      
      // * Dos formas de ver un checkbox

      // return Checkbox(
      //   value: _bloquearCheck,
      //   onChanged: (valor) {
      //     setState(() {
      //       _bloquearCheck = valor!;
      //     });
      //   }
      // );

      return CheckboxListTile(
        title: const Text('Bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor!;
          });
        }
      );
  }

  Widget _crearSwitch() {
    
    return SwitchListTile(
        title: const Text('Bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        }
      );
  }
 }