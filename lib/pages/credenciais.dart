/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_fest/Services/authService.dart';
import 'package:google_sign_in/google_sign_in.dart';

final googleSignIn = AuthService.;
//final auth = FirebaseAuth.instance;

/*Future<Null> _ensureLoggedIn() async {
  GoogleSignInAccount user = googleSignIn.currentUser;
  if (user == null)
    user = await googleSignIn.signInSilently();
  if (user == null)
    user = await googleSignIn.signIn();
  if (await auth.currentUser() == null) {
    GoogleSignInAuthentication credentials = await googleSignIn.currentUser
        .authentication;
    await auth.signInWithCredential(GoogleAuthProvider.getCredential(
        idToken: credentials.idToken, accessToken: credentials.accessToken));
  }

}*/

class Credenciais {

  static String tipo;
  static String UserGoo;
  static var UserFoto;

  static tipoLogin(String l)
  {

  }

  static retornaUsuario() {

    if(Credenciais.tipo == "g") {
      //_ensureLoggedIn();
      UserGoo = googleSignIn.currentUser.displayName;
      UserFoto = googleSignIn.currentUser.photoUrl;
    }else
    {
      print("Deu Erro!!");
    }
  }
}

*/

