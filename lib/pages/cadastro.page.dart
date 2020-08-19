import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_fest/pages/login.page.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  var _FormalKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final senhacontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _FormalKey,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: double.maxFinite,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.all(32),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFFF58524),
                            Color(0xFFF92B7F),
                          ]),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text(
                            'FestApp',
                            style: TextStyle(
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
                          padding: EdgeInsets.only(top: 15, bottom: 62),
                          child: Text(
                            'Cadastrar',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (input) {
                            if (input.isEmpty) {
                              return "Preencha o campo";
                            } else if (input.length < 6) {
                              return "A senha necessita ter 6 caracteres";
                            }
                          },
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(20.0)),
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
                            errorStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12, bottom: 62),
                          child: TextFormField(
                            validator: (input) {
                              if (input.isEmpty) {
                                return "Preencha o campo";
                              } else if (input.length < 6) {
                                return "A senha necessita ter 6 caracteres";
                              }
                            },
                            controller: senhacontroller,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              border: new OutlineInputBorder(
                                  borderRadius:
                                      new BorderRadius.circular(20.0)),
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
                              errorStyle: TextStyle(
                                color: Colors.black,
                              ),
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
                                stops: [
                                  0.3,
                                  1
                                ],
                                colors: [
                                  Colors.lightGreenAccent,
                                  Colors.lightBlue
                                ]),
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
                                onPressed: () {
                                  _signup();

                                  Navigator.pop(context);
                                }),
                          ),
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
                              onPressed: () => {
                              Navigator.pop(context)
                                  }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> _signup() async {
    if (_FormalKey.currentState.validate()) {
      _FormalKey.currentState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailcontroller.text,
                password: senhacontroller.text) as FirebaseUser;
        await user.sendEmailVerification();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
