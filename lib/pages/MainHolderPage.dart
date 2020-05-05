import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web/object/User.dart';
import 'package:flutter_web/page_widget/AppStatusWidget.dart';
import 'package:flutter_web/page_widget/DeepLinkWidget.dart';
import 'package:flutter_web/page_widget/FaqWidget.dart';
import 'package:flutter_web/page_widget/PaymentsInfoWidget.dart';
import 'package:flutter_web/page_widget/PushNotificationWidget.dart';
import 'package:flutter_web/page_widget/RedirectedWidget.dart';
import 'package:flutter_web/page_widget/StatisticInfoWidget.dart';
import 'package:flutter_web/page_widget/UserInfoWidget.dart';
import 'package:flutter_web/pages/LoginPage.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';


class UserDataPage extends StatefulWidget {

  static User user ;

  @override
  _UserDataPageState createState() => _UserDataPageState();
}

class _UserDataPageState extends State<UserDataPage> {

  var userId = 1234567890;
  var userBalance = '-1';

  var selectedItemIndex = 0;

  var isMobile = false;
  var isServerStarted = false;

  TextEditingController sumController;
  TextEditingController emailTelegrgamController;

  @override
  void initState() {
    getUserBalance(userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if (sumController == null) {
      sumController = TextEditingController();
      emailTelegrgamController = TextEditingController();
      emailTelegrgamController.text = '\@ALEX';
      sumController.text = '50\$';
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


    Dialog paymentDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          color: Colors.white,
          height: 350.0,
          width: 300.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'SET SUM IN USD(\$) TO CREATE A BILL\n(MIN 50 USD):',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: myBoxDecoration(),
                  child: TextField(
                      controller: sumController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xFFFFFFFF),
                          filled: true)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'EMAIL/TELEGRAM (FOR PAYMENT LINK)',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: myBoxDecoration(),
                  child: TextField(
                      controller: emailTelegrgamController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xFFFFFFFF),
                          filled: true)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: 275,
                    height: 50,
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
                      'REQUEST PAYMENT LINK',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      body: Stack(children: <Widget>[
        //
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Container(
              color: Color(0xfffbb448),
              height: MediaQuery.of(context).size.height,
              width: isMobile ? 50 : 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 550,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        navigationBtnCreator('APPS STATUS', 0),
                        navigationBtnCreator('USER INFO', 1),
                        navigationBtnCreator('PAYMENTS & SPENDS', 2),
                        navigationBtnCreator('STATISTIC INFO', 3),
                        navigationBtnCreator('HOW TO USE', 4),
                        navigationBtnCreator('PUSH NOTIFICATIONS', 5),
                        navigationBtnCreator('REDIRECT URLs', 6),
                        navigationBtnCreator('DEEP LINK URLs', 7),
                      ],
                    ),
                  ),
                  Container(child: isMobile ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: GestureDetector(onTap: (){
                          openURL('https://www.facebook.com/business/tools/ads-manager');
                        },child: Image.asset('fb_ads.png', height: 42, width: 42)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: GestureDetector(
                            onTap: (){
                              openURL('https://web.telegram.org/#/login');
                            },
                            child: Image.asset('telegram.png', height: 42, width: 42,)),
                      ),
                    ],) : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(onTap: (){
                        openURL('https://www.facebook.com/business/tools/ads-manager');
                      },child: Image.asset('fb_ads.png', height: 64, width: 64)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GestureDetector(
                            onTap: (){
                              openURL('https://web.telegram.org/#/login');
                            },
                            child: Image.asset('telegram.png', height: 64, width: 64,)),
                      ),
                  ],),),
                ],
              ),
            ),
          ),
        ),
        //
        Align(
          alignment: Alignment.topRight,
          child: Container(
            color: Color(0xff000000),
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(left: isMobile ? 50 : 300),
                  child: Container(
                    width: 600,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            isServerStarted = !isServerStarted;
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: isMobile ? 80 : 150,
                              height: 30,
                              padding: EdgeInsets.symmetric(vertical: 4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(2)),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: isServerStarted ? [Color(0xffff7b00), Color(0xffeb3700)] : [Color(0xff007527), Color(0xff40ff80)])),
                              child: Text(
                                isServerStarted ? 'STOP WORK' : 'START WORK',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Text(
                        'YOUR BALANCE $userBalance\$',
                        style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => paymentDialog);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width:  isMobile ? 80 : 150,
                              height: 30,
                              padding: EdgeInsets.symmetric(vertical: 4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(2)),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [Color(0xfffbb448), Color(0xfff7892b)])),
                              child: Text(
                                'REQUEST INVOICE',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: isMobile ? 10: 12, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: isMobile ? Alignment.centerLeft : Alignment.centerRight,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 48.0, left: 16.0 ),
                    child: Icon(Icons.exit_to_app, size: 32, color: Colors.white,)
                  ),
                ),
              ),
            ],),
          ),
        ),
        Container(child: selectedItemIndex == 0 ? AppStatusWidget(isMobile)
            : selectedItemIndex == 1 ? UserInfoWidget(isMobile)
            : selectedItemIndex == 2 ? PaymentsInfoWidget(isMobile)
            : selectedItemIndex == 3 ? StatisticWidget(isMobile)
            : selectedItemIndex == 4 ? FAQWidget(isMobile)
            : selectedItemIndex == 5 ? PushNotificationWidget(isMobile)
            : selectedItemIndex == 6 ? RedirectedWidget(isMobile)
            : selectedItemIndex == 7 ? DeepLinkWidget(isMobile)
            : Container()
        ),
        //
      ],)
    );
  }

  Widget navigationBtnCreator(name, index){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedItemIndex = index;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  index == 0 ? Icons.check_circle :
                  index == 1 ? Icons.supervised_user_circle :
                  index == 2 ? Icons.monetization_on :
                  index == 3 ? Icons.insert_chart :
                  index == 4 ? Icons.info :
                  index == 5 ? Icons.message :
                  index == 6 ? Icons.link :
                  Icons.phonelink_ring,
                  size: 32, color: Colors.white,),
              ),
              isMobile ? Container() : Padding(
                padding: const EdgeInsets.all(8),
                child: AnimatedDefaultTextStyle(
                  style: selectedItemIndex == index
                      ? TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)
                      : TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                  duration: const Duration(milliseconds: 100),
                  child: Text(name),
                ),
              ) ,
              ],
          ),
          Container(
            width: isMobile ? 40 : 300,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future openURL(uri) async {
    var url = uri;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
          width: 2.0
      ),
      borderRadius: BorderRadius.all(
          Radius.circular(5.0)
      ),
    );
  }


  void getUserBalance(id) async {
    http.get('http://127.0.0.1:8080/get_user_balance?user_id=$id').then((http.Response response) {
      userBalance = response.body;
      setState(() {});
    }).catchError((e){
      print(e);
      userBalance = '0';
    });
  }

}
