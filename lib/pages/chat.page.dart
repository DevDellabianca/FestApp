import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_fest/pages/login.page.dart';

//import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_app_fest/pages/credenciais.dart';

import 'package:flutter_app_fest/Services/authService.dart';

//final googleSignIn = GoogleSignIn();
//final auth = FirebaseAuth.instance;
/*Future<Null> _ensureLoggedIn() async {
  GoogleSignInAccount user = googleSignIn.currentUser;
  if(user == null)
    user = await googleSignIn.signInSilently();
  if(user == null)
    user = await googleSignIn.signIn();
  if(await auth.currentUser() == null){
    GoogleSignInAuthentication credentials = await googleSignIn.currentUser.authentication;
    await auth.signInWithCredential(GoogleAuthProvider.getCredential(
        idToken: credentials.idToken, accessToken: credentials.accessToken));

  }

}*/
_signOut() async {
  //
}

/*Future logout() async {
  FirebaseAuth.instance.
  var result = FirebaseAuth.instance.signOut();
  await googleSignIn.signOut();
  await auth.signOut();
  Credenciais.UserGoo = null;
  Credenciais.UserFoto = null;
  return result;

}*/

/*void _SignOut(){
  FirebaseAuth.instance.signOut();
  FirebaseAuth.instance.signOut();

  FirebaseAuth.instance.signOut();
  auth.signOut();

}*/

/*Future<Null> _ensureSignOut() async{
  GoogleSignInAccount user = googleSignIn.currentUser;
  user = null;
  auth.signOut();
  googleSignIn.signOut();
}*/

_handleSubmitted(String text) async {
  _sendMessage(text: text);
}

_sendMessage({String text, String imgUrl}) {
  Credenciais.retornaUsuario();
  if (Credenciais.UserGoo == null || Credenciais.UserGoo == "") {
    print("Usuario sem nome");
  }
  if (text.trim() == "" || text == null) {
    print("Texto invalido");
  } else {
    Firestore.instance.collection("mensagens").add({
      "text": text,
      "imgUrl": imgUrl,
      "senderName": Credenciais.UserGoo, //googleSignIn.currentUser.displayName
      "senderPhotoUrl": Credenciais.UserFoto,
      "sendTime": Timestamp.now(),
    });
  }
}

// __________________________________CODIGO CERTO__________________________________
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  List<String> itensMenu = ["Sair"];

  _sair() async {
    AuthService.signOut();
    //FirebaseAuth auth = FirebaseAuth.instance;

    /*
    await auth.signOut();
    await googleSignIn.signOut();
    await googleSignIn.disconnect();
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => LoginPage(),
    ),
    );
    */
  }

// Metodo
  _escolhaMenuIntem(String escolha) {
    switch (escolha) {
      case "Sair":
        _sair();
        break;
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      right: false,
      top: false,
      child: Scaffold(
        appBar: AppBar(
            title: Text("Fest Chat"),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  _escolhaMenuIntem("Sair");
                  print("Logout");
                  Navigator.pop(context);
                },
                child: new Text(
                  "Sair",
                  style: new TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
            centerTitle: true,
            elevation:
                Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0),
        body: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("mensagens")
                      .orderBy('sendTime')
                      .snapshots(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        return ListView.builder(
                            reverse: true,
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              List r =
                                  snapshot.data.documents.reversed.toList();
                              return ChatMessage(r[index].data);
                            });
                    }
                  }),
            ),
            Divider(
              height: 1.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: TextComposer(),
            )
          ],
        ),
      ),
    );
  }
}

class TextComposer extends StatefulWidget {
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  final _textController = TextEditingController();
  bool _isComposing = false;

  void _reset() {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: Theme.of(context).platform == TargetPlatform.iOS
            ? BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey[200])))
            : null,
        child: Row(
          children: <Widget>[
            Container(
              child: IconButton(
                  icon: Icon(Icons.photo_camera),
                  onPressed: () async {
                    File imgFile =
                        await ImagePicker.pickImage(source: ImageSource.camera);
                    if (imgFile == null) return;
                    StorageUploadTask task = FirebaseStorage.instance
                        .ref()
                        .child(AuthService.fotoGoogle() +
                            DateTime.now().millisecondsSinceEpoch.toString())
                        .putFile(imgFile);
                    StorageTaskSnapshot taskSnapshot = await task.onComplete;
                    String url = await taskSnapshot.ref.getDownloadURL();
                    _sendMessage(imgUrl: url);
                    StorageTaskSnapshot snap = await task.onComplete;
                    _sendMessage(imgUrl: await snap.ref.getDownloadURL());
                  }),
            ),
            Expanded(
              child: TextField(
                controller: _textController,
                decoration:
                    InputDecoration.collapsed(hintText: "Enviar uma Mensagem"),
                onChanged: (text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                onSubmitted: (text) {
                  _handleSubmitted(text);
                  _reset();
                },
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Theme.of(context).platform == TargetPlatform.iOS
                    ? CupertinoButton(
                        child: Text("Done"),
                        onPressed: _isComposing
                            ? () {
                                _handleSubmitted(_textController.text);
                                _reset();
                              }
                            : null,
                      )
                    : IconButton(
                        icon: Icon(Icons.send),
                        onPressed: _isComposing
                            ? () {
                                _handleSubmitted(_textController.text);
                                _reset();
                              }
                            : null,
                      ))
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final Map<String, dynamic> data;

  ChatMessage(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(data["senderPhotoUrl"]),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  data["senderName"],
                  style: Theme.of(context).textTheme.subhead,
                ),
                Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: data["imgUrl"] != null
                        ? Image.network(
                            data["imgUrl"],
                            width: 250.0,
                          )
                        : Text(data["text"]))
              ],
            ),
          )
        ],
      ),
    );
  }
}

//______________________________________FIM__________________________________________
/* buildMessageComposer(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: (){
            },
          ),
          Expanded(
            child: TextField(
              controller: _textController,
                decoration:
                  InputDecoration.collapsed(hintText:"Envie uma mensagem..."),
              textCapitalization: TextCapitalization.sentences,
              onChanged: (text) {
                setState(() {
                  // _isComposing = text.length > 0;
                });
              },
              onSubmitted: (text){
                  _handleSubmitted(text);
                  _reset();
              },

            ),
          ),
          IconButton(
            alignment: Alignment.centerRight,
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: (){
              _handleSubmitted(_textController.text);
              _reset();
            },
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(widget.user.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: (){},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15),
                    itemCount: messages.length,
                    itemBuilder:(BuildContext context, int index){
                      final Message message = messages[index];
                      bool isMe = message.sender.id == currentUser.id;
                     // return buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}*/
/*mixin ChatMessage implements StatelessWidget {
  @override
  Widget buildMessage(Message message, bool isMe){
    final Container msg =
        Container(
        margin: isMe ? EdgeInsets.only(
        top: 4.0,
        bottom: 8.0,
        left: 40.0)
        : EdgeInsets.only(
    top: 4.0,
    bottom: 8.0,
    ),
    padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
    width: MediaQuery.of(context).size.width * 0.75,
    decoration: BoxDecoration(
    color: isMe ? color1
        : color2,
    borderRadius: isMe? BorderRadius.only(
    topLeft: Radius.circular(15),
    bottomLeft: Radius.circular(15),
    ):  BorderRadius.only(
    topRight: Radius.circular(15),
    bottomRight: Radius.circular(15),
    ),
    ),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[



          Text(
            message.time,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            message.text,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          ],
        ),
    );
    if(isMe){
    return msg;
    }
    return Row(
    children: <Widget>[
    msg,
    ! isMe ? IconButton(
    icon: message.isLiked
    ? Icon(Icons.favorite)
        : Icon(Icons.favorite_border),
    iconSize: 30.0,
    color: message.isLiked
    ? color3
        : Colors.blueGrey,
    onPressed: (){},
    )
        : SizedBox.shrink(),
    ],
    );
  }

}


class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
Color color1 = HexColor("DAF7C5");
Color color2 = HexColor("F7E3C5");
Color color3 = HexColor("FF0000");
class _ChatScreenState extends State<ChatScreen> {

  final _textController = TextEditingController();

  void _reset(){
    _textController.clear();
  }
*/
