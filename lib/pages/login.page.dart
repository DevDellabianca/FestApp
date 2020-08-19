import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_fest/pages/cadastro.page.dart';
import 'package:flutter_app_fest/pages/chat.page.dart' as prefix0;
import 'package:flutter_app_fest/Services/authService.dart';

final emailcontroller = TextEditingController();
final senhacontroller = TextEditingController();

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  static var FormalKey = GlobalKey<FormState>();

  @override
  static String tipo;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: FormalKey,
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
                    child: ListView(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(
                              width: 60,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15, bottom: 62),
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
                              height: 30,
                            ),
                            TextFormField(
                              validator: (input) {
                                if (input.isEmpty && input.contains("@")) {
                                  return "insira um email.";
                                }
                              },
                              controller: emailcontroller,
                              decoration: InputDecoration(
                                labelText: 'Usuário',
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
                                        "Login",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                  onPressed: (){
                                    signin();
                                    if(tipo == "n"){
                                     Credenciais.email  = emailcontroller.text;
                                      Credenciais.tipo = "n";
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              prefix0.ChatScreen(),
                                        ),
                                      );
                                    }else{
                                      print("Deu erro no login normal");
                                    }

                                  }
                                ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Criar perfil com E-mail",
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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CadastroPage(),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            SizedBox(
                              height: 25, //15
                            ),
                            /*Container(
                              height: 40,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                              child: SizedBox.expand(
                                child: FlatButton(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Login com Facebook   ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                            child: Image.asset(
                                                "images/fb-icon.png"),
                                            height: 25,
                                            width: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {
                                      AuthService.signOut();

                                    }),
                              ),
                            ),*/
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 40,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                              child: SizedBox.expand(
                                child: FlatButton(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Login com Google       ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                            child: Image.asset(
                                                "images/googleicon.png"),
                                            height: 25,
                                            width: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {
                                      AuthService.signInGoogle().then((status) {
                                        if (status == true) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  prefix0.ChatScreen(),
                                            ),
                                          );
                                        } else {
                                          print("Deu erro");
                                          //Navegar para pagina de erro
                                        }
                                      });
                                    }),
                              ),
                            ),
                          ],
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

  static Future<void>signin()async{
    final FormState = FormalKey.currentState;

    if(FormState.validate()){
      try {
        AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailcontroller.text, password: senhacontroller.text);
        final user2 = result.user;
        tipo = "n";
      }
      catch(e) {
        final user2 = FirebaseAuth.instance.signOut();
        print("Error: ${e.toString()}");
      }
    }
  }
}