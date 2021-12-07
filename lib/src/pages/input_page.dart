import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name ='';
  String _email ='';
  String _password ='';
  String _fecha = '';

  List<String> _poderes = ['Volar', 'Rayos X', 'Super fuerza', 'Super visión'];
  String? _opcionSeleccionada = 'Volar'; 

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input de texto'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(), 
          Divider(), 
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona()],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration:  InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          counter: Text('Letras ${ _name.length}'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Solo para ti',
          suffixIcon: const Icon(Icons.accessibility),
          icon: const Icon(Icons.account_box)),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget  _crearPersona() {
     return ListTile(
       title: Text('Nombre es: $_name'),
       subtitle: Text('Email: $_email'),
       trailing: Text(_opcionSeleccionada!),
     );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (value)  => setState(() {
          _email = value;
        })
    );
  }

  Widget _crearPassword() {
    return TextField(
        obscureText: true,
        decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            hintText: 'Contraseña',
            labelText: 'Contraseña',
            suffixIcon: Icon(Icons.lock_open),
            icon: Icon(Icons.lock)),
        onChanged: (value) => setState(() {
              _password = value;
            }));
  }

  Widget _crearFecha(BuildContext context) {
     return TextField(
       enableInteractiveSelection: false,
       controller: _inputFieldDateController,
        decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            hintText: 'Fecha de nacimiento',
            labelText: 'Fecha de nacimiento',
            suffixIcon: Icon(Icons.calendar_today_rounded),
            icon: Icon(Icons.calendar_today)),
            onTap: (){
              FocusScope.of(context).requestFocus(new FocusNode());
              _selectDate(context);
            },
      );
  }

  void _selectDate(BuildContext context) async{
    DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(1920), 
      lastDate: DateTime.now(),
      locale: const Locale('es','ES')
      );

      if (picked != null) {
        setState(() {
          _fecha = picked.toString(); 
          _inputFieldDateController.text = _fecha;
        });
      }
  }

  List<DropdownMenuItem<String>> getOptDropdown() {
    List<DropdownMenuItem<String>> lista = [];

    _poderes.forEach((poder) {
      
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        DropdownButton(
          value: _opcionSeleccionada,
          items: getOptDropdown(), 
          onChanged: (String? opt) {
            setState(() {
              _opcionSeleccionada = opt;
            });
          },
          ),
      ],
    );
  }
}
