/*import 'package:flutter/material.dart';
import 'package:flutter_app_fest/pages/verificacao.page.dart';

class ReturnVerification extends StatefulWidget {
  @override
  _ReturnVerificationState createState() => _ReturnVerificationState();
}

class _ReturnVerificationState extends State<ReturnVerification> {
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
                        padding: EdgeInsets.only(top:15, bottom:100),
                        child: Text(
                          'Código de verificação',
                          style : TextStyle
                            (
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:15, bottom:10),
                        child: Text(
                          'Foi enviado um novo código, confira seu E-mail.',
                          style : TextStyle
                            (
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
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
                                  "Voltar",
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
                                context, MaterialPageRoute(builder: (context) => VerificacaoPage(),
                              ),
                              );
                            },
                          ),
                        ) ,
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