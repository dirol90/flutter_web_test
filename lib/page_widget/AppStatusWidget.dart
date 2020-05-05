import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:clippy/browser.dart' as clippy;
import 'package:flutter_web/object/AppStatus.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;

class AppStatusWidget extends StatefulWidget {
  bool isMobile;

  AppStatusWidget(this.isMobile);

  @override
  _AppStatusWidgetState createState() => _AppStatusWidgetState();
}

class _AppStatusWidgetState extends State<AppStatusWidget> {

  var gamblingApp = 'LOADING...';
  var datingApp = 'LOADING...';
  var bettingApp = 'LOADING...';
  var nutraApp = 'LOADING...';
  var cryptoApp = 'LOADING...';

  var serverTime = DateTime.now();
  var lastAppsCheckTime;

  Timer timer;

  @override
  void initState() {
    getAcyncAppStatusData();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm:ss').format(DateTime.now());

    if (lastAppsCheckTime == null) {
      lastAppsCheckTime = DateTime.now();
    }

    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => updateServerTime());

    return Padding(
      padding: EdgeInsets.only(
          left: widget.isMobile ? 50 : 300, top: 100 ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: myBoxDecoration(),
              width: 300,
              height: 260,
              child: Column (
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Container(width: 120, child: Text('SERVER TIME: ',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
                        Text('$formattedDate', style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Container(width: 120, child: Text('LAST CHECK: ',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
                        Text('${DateFormat('yyyy-MM-dd – kk:mm:ss').format(lastAppsCheckTime)}', style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Container(width: 120, child: Text('GAMEBLING: ',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
                        Text('${gamblingApp}', style: new TextStyle(fontWeight: FontWeight.bold, color: gamblingApp == 'OK' ? Colors.lightGreen: Colors.red)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Container(width: 120, child: Text('DATING: ',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
                        Text('${datingApp}', style: new TextStyle(fontWeight: FontWeight.bold, color: datingApp == 'OK' ? Colors.lightGreen: Colors.red)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Container(width: 120, child: Text('BETTING: ',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
                        Text('${bettingApp}', style: new TextStyle(fontWeight: FontWeight.bold, color: bettingApp == 'OK' ? Colors.lightGreen: Colors.red)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Container(width: 120, child: Text('NUTRA: ',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
                        Text('${nutraApp}', style: new TextStyle(fontWeight: FontWeight.bold, color: nutraApp == 'OK' ? Colors.lightGreen: Colors.red)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Container(width: 120, child: Text('CRYPTO: ',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
                        Text('${cryptoApp}', style: new TextStyle(fontWeight: FontWeight.bold, color: cryptoApp == 'OK' ? Colors.lightGreen: Colors.red)),
                      ],
                    ),
                  ),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }

  getAcyncAppStatusData() async {

    var s = await getData();
    gamblingApp = s.app1 == true ? 'OK' : 'DELETED';
    bettingApp =  s.app2 == true ? 'OK' : 'DELETED';
    datingApp =  s.app3 == true ? 'OK' : 'DELETED';
    nutraApp =  s.app4 == true ? 'OK' : 'DELETED';
    cryptoApp =  s.app5 == true ? 'OK' : 'DELETED';
    lastAppsCheckTime = DateTime.fromMillisecondsSinceEpoch(s.parsingDate);
    setState(() {});
  }

  Future<AppStatus> getData() async {
    return http.get('http://127.0.0.1:8080/get_app_status').then((http.Response response) {
      return AppStatus.fromJson(json.decode(response.body));
    }).catchError((e){
      print(e);
      return AppStatus(false, false, false, false, false, DateTime.now().millisecondsSinceEpoch);
    });
  }


  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width: 3.0, color: Color(0xfffbb448)),
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    );
  }

  void updateServerTime(){
    setState(() {
      serverTime = DateTime.now();
    });
  }


}
