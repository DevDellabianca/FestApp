/*
import 'package:flutter/material.dart';
import 'package:flutter_app_fest/pages/telas_chat.dart';
import 'package:flutter_app_fest/widgets/Carrousel_eventos.dart';

import 'package:flutter_app_fest/widgets/Carrousel_eventos_destaques.dart';

class ConfirmarPresencaPage extends StatefulWidget {
  @override
  _ConfirmarPresencaPageState createState() => _ConfirmarPresencaPageState();
}

class _ConfirmarPresencaPageState extends State<ConfirmarPresencaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10, left:5, right:10),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Buscar evento',
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0)
                    ),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black26,
                      fontSize: 18,
                    ),
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black26,
                      fontSize: 18,
                    ),
                    icon: IconButton(
                      icon: Icon(Icons.search),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: (){},
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CarroselEventos(),
              EventosNormais(),
            ],
          ),
        ),
      ),

    );
  }
}
*/