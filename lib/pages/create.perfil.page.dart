/*import 'package:flutter/material.dart';
import 'package:flutter_app_fest/pages/chat.page.dart';
import 'package:flutter_app_fest/pages/evento.page.dart';
import 'package:flutter_app_fest/pages/telas_chat.dart';

class CreatePerfilPage extends StatefulWidget {
  @override
  _CreatePerfilPageState createState() => _CreatePerfilPageState();
}

class _CreatePerfilPageState extends State<CreatePerfilPage> {
  @override
  bool value1= false;
  bool value2= false;
  void onChangedValue(bool value) {
    setState(() {
      value1 =value;
    });
  }
  void onChangedValue2(bool value) {
    setState(() {
      value2 =value;
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: double.maxFinite,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 0,left: 0, right: 0,),
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
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'FestApp',
                        style : TextStyle
                          (
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Crie seu perfil.',
                        style : TextStyle
                          (
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 110,
                      height: 110,
                      alignment: Alignment(0.0, 3.45),
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: AssetImage("images/perfil.jpg"),
                          fit: BoxFit.fitHeight,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(60),
                        ),
                      ),
                      child:Container(
                        height: 56,
                        width: 56,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.3, 1.0],
                              colors: [
                                Colors.lightGreenAccent, Colors.lightBlue
                              ]
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(60)
                          ),
                        ),
                        child: SizedBox.expand(
                          child: FlatButton(
                            child: Icon(
                              IconData(
                                57669,
                                fontFamily: 'MaterialIcons',
                              ),
                              color: Colors.white,
                            ),
                            onPressed: (){},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 340,left: 20, right: 20,),
                child: ListView(
                  children: <Widget>[
                    new TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Nome:',
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
                        labelText: 'Data de Nascimento:',
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
                        labelText: 'Biografia:',
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
                    Container(
                      padding: new EdgeInsets.all(32.0),
                      child: new Center(
                        child: new Column(
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new Checkbox(value: value1, onChanged: onChangedValue,activeColor: Colors.lightGreenAccent),
                                Text(
                                  "Masculino",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                new Checkbox(value: value2, onChanged: onChangedValue2, activeColor: Colors.lightGreenAccent,),

                                Text(
                                  "Feminino",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
                                  "Criar Perfil",
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
                                builder: (context) => ChatScreen(),
                              ),
                              );
                            }
                        ),
                      ) ,
                    ),
                    SizedBox(
                      height: 20,
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