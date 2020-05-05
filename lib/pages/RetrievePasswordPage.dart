import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web/pages/LoginPage.dart';
import 'package:flutter_web/widgets/BezierContainer.dart';

class RetrievePasswordPage extends StatefulWidget {
  RetrievePasswordPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RetrievePasswordPageState createState() => _RetrievePasswordPageState();
}

class _RetrievePasswordPageState extends State<RetrievePasswordPage> {
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
        if (em.text == ''){isErrorText += '\nEmail is empty';}
        if (isErrorText == ''){
          registrationSuccess = 'New password was sended to your email!';
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
          'Request Password Now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  TextEditingController em;


  Widget _emailPasswordWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        isErrorText == '' ?
        Text(registrationSuccess, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),) :
        Text(isErrorText, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red),),
        _entryField("Email", em),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    if (em == null) {
      em = TextEditingController();
      em.text = '';
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
          Positioned(top: 40, left: 0, child: _backButton()),

        ],
      ),
    );
  }
}