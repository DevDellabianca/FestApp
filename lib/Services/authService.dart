import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_fest/pages/login.page.dart';
import 'package:google_sign_in/google_sign_in.dart';

final googleSignIn = GoogleSignIn();
final auth = FirebaseAuth.instance;

class AuthService {
  static signInEmail(String email, String password) {
    auth.signInWithEmailAndPassword(email: email, password: password);
  }

  static fotoGoogle() async {
    googleSignIn.currentUser.id.toString();
  }

  static Future<bool> signInGoogle() async {
    GoogleSignInAccount user = googleSignIn.currentUser;
    if (user == null) {
      user = await googleSignIn.signInSilently();
      if (user == null) {
        user = await googleSignIn.signIn();
      }
    }

    if (await auth.currentUser() == null) {
      GoogleSignInAuthentication credentials =
          await googleSignIn.currentUser.authentication;
      await auth.signInWithCredential(GoogleAuthProvider.getCredential(
          idToken: credentials.idToken, accessToken: credentials.accessToken));
    }
    if (user == null) {
      Credenciais.tipo = "";
      return false;
    } else {
      Credenciais.tipo = "g";
      return true;
    }
  }

  static signInFacebook() {}

  static signUp(String email, String password) {}

  static signOut() async {
    await auth.signOut();
    await googleSignIn.signOut();
    //await googleSignIn.disconnect();
  }

  static currentUser() async {
    return auth.currentUser();
  }
}

class Credenciais {
  static String tipo;
  static String UserGoo;
  static var UserFoto;
  static String email;

  static tipoLogin(String l) {}

  static retornaUsuario() {
    if (Credenciais.tipo == "n") {
      UserGoo = email;
      UserFoto = "http://www.historiadeboaviagem.com.br/wp-content/uploads/Perfil-sem-imagem.jpg";
    }
    if (Credenciais.tipo == "g") {
      UserGoo = googleSignIn.currentUser.displayName;
      UserFoto = googleSignIn.currentUser.photoUrl;
    } else {
      print("Deu Erro!!");
    }
  }
}
