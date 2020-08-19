/*import 'package:flutter/material.dart';
import 'package:flutter_app_fest/pages/confirmar_presenca_evento.page.dart';

class EventoPage extends StatefulWidget {
  @override
  _EventoPageState createState() => _EventoPageState();
}

class _EventoPageState extends State<EventoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text("Evento",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: double.maxFinite,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                child : Container(
                  padding: EdgeInsets.only(top: 0, left: 0, right: 0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors:[
                          Color(0xFFF58524),
                          Color(0xFFF92B7F),]
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        alignment: Alignment.centerLeft,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: AssetImage("images/noimage2.png"),
                            fit: BoxFit.fitHeight,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: SizedBox.expand(
                          child: FlatButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                ],
                              ),
                              onPressed: ()
                              {
                                // Navigator.push(
                                // context, MaterialPageRoute(
                                //   builder: (context) => CadastroPage(),
                                // ),
                                // );
                              }
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 200, left: 25, right: 25),
                child: ListView(
                  children: <Widget>[
                    new TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Nome do evento:',
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)
                        ),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    new TextField(
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: 'Data do evento:',
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)
                        ),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),SizedBox(
                      height: 10,
                    ),
                    new TextField(
                      maxLines: 5,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Descrição do evento:',
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)
                        ),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 40,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.3, 1],
                            colors: [
                              Colors.lightGreenAccent, Colors.lightBlue
                            ]
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),

                      child: SizedBox.expand(
                        child: FlatButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Criar evento",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            onPressed: ()
                            {
                              Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context) => ConfirmarPresencaPage(),
                              ),
                              );
                            }
                        ),
                      ) ,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/