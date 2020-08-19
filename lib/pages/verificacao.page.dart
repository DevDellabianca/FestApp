/*import 'package:flutter/material.dart';
import 'package:flutter_app_fest/pages/cadastro.page.dart';
import 'package:flutter_app_fest/pages/lost.verification.page.dart';
import 'package:flutter_app_fest/pages/telas_chat.dart';

class VerificacaoPage extends StatefulWidget {
  @override
  _VerificacaoPageState createState() => _VerificacaoPageState();
}

class _VerificacaoPageState extends State<VerificacaoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding: EdgeInsets.all(32),
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
                      Padding(
                        padding: EdgeInsets.only(top:40),
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
                        height: 0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:15, bottom:62),
                        child: Text(
                          'Verificação',
                          style : TextStyle
                            (
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new TextField(
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Código de verificação',
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
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: FlatButton(
                            child: Text(
                              "Não recebeu um código? clique aqui!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            onPressed: () =>
                            {
                              Navigator.push(
                                context, MaterialPageRoute(builder: (context) => LostVerificationPage(),
                              ),
                              ),
                            }
                        ),
                      ),
                      SizedBox(
                        height: 15,
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
                                    "Confirmar",
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
                                    context, MaterialPageRoute(builder: (context) => HomeScreen(),
                                ));
                              }
                          ),
                        ) ,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 40,
                        alignment: Alignment.topCenter,
                        child: FlatButton(
                            child: Text(
                              "Voltar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            onPressed: () =>
                            {
                              Navigator.push(
                                context, MaterialPageRoute(builder: (context) => CadastroPage(),
                              ),
                              ),
                            }
                        ),
                      ),
                    ],
                  ),
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