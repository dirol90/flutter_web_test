import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web/object/Payments.dart';
import 'package:flutter_web/object/User.dart';
import 'package:flutter_web/object/UserCredentials.dart';
import 'package:flutter_web/pages/LoginPage.dart';
import 'package:flutter_web/widgets/BezierContainer.dart';
import 'package:uuid/uuid.dart';

import 'package:http/http.dart' as http;
import 'MainHolderPage.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var isMobile = false;
  var isErrorText = '';
  var registrationSuccess = '';

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black, size: 16,),
            ),
            Text('Back',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, TextEditingController tc, {bool isPassword = false}) {
    return Container(
      width: MediaQuery.of(context).size.width/(isMobile ? 1 :5 ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: tc,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: (){
        isErrorText = '';
        if (te.text == ''){isErrorText += '\nTelegram is empty';}
        if (em.text == ''){isErrorText += '\nEmail is empty';}
        if (pw.text == ''){isErrorText += '\nPassword is empty';}
        if (pw2.text == ''){isErrorText += '\nPassword repeat is empty';}
        if (pw2.text != pw.text){isErrorText += '\nPassword and repeated password are not same';}
        if (isErrorText == ''){
          registrationSuccess = 'Registration Success!';
          var uuid = Uuid();
          User user = User('\"${uuid.v4()}\"', DateTime.now().millisecondsSinceEpoch, '', '\"${te.text}\"', true, false, false, false, false, 0, 0, List<String>(), List<Payment>(), UserCredentials('\"${em.text}\"', '\"${pw.text}\"', '\"${uuid.v1()}\"'));
          saveUser(user);
        }
        setState(() {
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width/(isMobile ? 1 : 5 ),
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
        child: Text(
          'Register Now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  TextEditingController te;
  TextEditingController em;
  TextEditingController pw;
  TextEditingController pw2;
  TextEditingController pe;


  Widget _emailPasswordWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        isErrorText == '' ?
        Text(registrationSuccess, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),) :
        Text(isErrorText, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red),),
        _entryField("Telegram", te),
        _entryField("Email", em),
        _entryField("Password", pw, isPassword: true),
        _entryField("Password Repeat", pw2, isPassword: true),
        _entryField("Promo Code", pe),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    if (te == null) {
      te = TextEditingController();
      te.text = '';
    }
    if (em == null) {
      em = TextEditingController();
      em.text = '';
    }
    if (pw == null) {
      pw = TextEditingController();
      pw.text = '';
    }
    if (pw2 == null) {
      pw2 = TextEditingController();
      pw2.text = '';
    }
    if (pe == null) {
      pe = TextEditingController();
      pe.text = '';
    }


    if (MediaQuery.of(context).size.width < MediaQuery.of(context).size.height && !isMobile) {
      setState(() {
        isMobile = true;
      });
    } else if  (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height && isMobile) {
      setState(() {
        isMobile = false;
      });
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: SizedBox(),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(child: _emailPasswordWidget()),
                SizedBox(
                  height: 20,
                ),
                _submitButton(),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _loginAccountLabel(),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),

        ],
      ),
    );
  }

  Future<bool> saveUser ( User user ) async {
    await http.post('http://127.0.0.1:8080/register_user', body: user.toJson(), headers: {"Accept" : "application/json"}).then((http.Response response) {
      print(response.body);
      bool b = response.body.toLowerCase() == 'true';
      return b;
    }).catchError((e){
      print(e);
      return false;
    });
  }
}