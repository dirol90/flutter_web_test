import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web/web_stats/MainWebSettings.dart';

import 'package:http/http.dart' as http;
import 'package:clippy/browser.dart' as clippy;

class DeepLinkWidget extends StatefulWidget {

  bool isMobile;

  DeepLinkWidget(this.isMobile);

  @override
  _DeepLinkWidgetState createState() => _DeepLinkWidgetState();
}

class _DeepLinkWidgetState extends State<DeepLinkWidget> {

  @override
  void dispose() {
    super.dispose();
  }

  var userId = 1234567890;
  var isShowURIs = false;
  List<String> urlsList = List();
  var firstLoad = true;

  var isEdited = false;
  var editedIndex = -1;
  TextEditingController gamblingController;
  TextEditingController bettingController;
  TextEditingController datingController;
  TextEditingController nutraController;
  TextEditingController cryptoController;


  @override
  Widget build(BuildContext context) {

    if (firstLoad){
      firstLoad = false;
      getLinks(userId);
    }


    if (gamblingController == null) {
      gamblingController = TextEditingController();
      gamblingController.text = '';
    }
    if (bettingController == null) {
      bettingController = TextEditingController();
      bettingController.text = '';
    }
    if (datingController == null) {
      datingController = TextEditingController();
      datingController.text = '';
    }
    if (nutraController == null) {
      nutraController = TextEditingController();
      nutraController.text = '';
    }
    if (cryptoController == null) {
      cryptoController = TextEditingController();
      cryptoController.text = '';
    }

    return Padding(
      padding:  EdgeInsets.only(left: widget.isMobile ? 50 : 300, top: 100),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: widget.isMobile ? 840 : 640,
              child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                 Container(
                  child: Column(
                    children: <Widget>[
                      strokeWidget('GAMBLING FACEBOOK DEEP LINK:', gamblingController.text, false, 0, false),
                      strokeWidget('BETTING FACEBOOK DEEP LINK', bettingController.text, false, 1, false),
                      strokeWidget('DATING FACEBOOK DEEP LINK', datingController.text, false, 2, false),
                      strokeWidget('NUTRA FACEBOOK DEEP LINK', nutraController.text, false, 3, false),
                      strokeWidget('CRYPTO FACEBOOK DEEP LINK', cryptoController.text, false, 4, false),
                    ],
                  ),
                ),
            ],
            ),
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width: 3.0, color: Color(0xfffbb448)),
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    );
  }


  Widget strokeWidget(name, value, isPassword, index, isEditable) {

    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: widget.isMobile
              ? MediaQuery.of(context).size.width - 50
              : MediaQuery.of(context).size.width - 300,
          child: widget.isMobile
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: (widget.isMobile
                      ? MediaQuery.of(context).size.width - 50
                      : MediaQuery.of(context).size.width - 300) / 5 * 3,
                  child: Center(
                    child: Text(
                      name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: (widget.isMobile
                        ? MediaQuery.of(context).size.width - 50
                        : MediaQuery.of(context).size.width - 300) / 5 * 3,
                    height: 60,
                    decoration: myBoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: !(isEdited && editedIndex == index)
                          ? Center(
                        child: Text(
                          '${value}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      )
                          : TextField(
                          controller: index == 4
                              ? cryptoController
                              : index == 3
                              ? nutraController
                              : index == 2
                              ? gamblingController
                              : index == 1
                              ? bettingController
                              : datingController,
                          obscureText: isPassword,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Color(0xFFFFFFFF),
                              filled: true)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() async {
                              await clippy.write(value);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Icon(
                                  Icons.content_copy,
                                  size: 24,
                                  color: Color(0xfffbb448),
                                )),
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ],
          )
              : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 200,
                  child: Text(
                    name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 60,
                decoration: myBoxDecoration(),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: !(isEdited && editedIndex == index)
                        ? Text(
                      '${value}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    )
                        : TextField(
                        controller: index == 4
                            ? cryptoController
                            : index == 3
                            ? nutraController
                            : index == 2
                            ? gamblingController
                            : index == 1
                            ? datingController
                            : bettingController,
                        obscureText: isPassword,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Color(0xFFFFFFFF),
                            filled: true)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child:  GestureDetector(
                      onTap: () {
                        setState(() async {
                          await clippy.write(value); // USER ID
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Icon(
                              Icons.content_copy,
                              size: 24,
                              color: Color(0xfffbb448),
                            )),
                      ),
                    )),
              )
            ],
          ),
        ));
  }

  void getLinks(id) {
    http.get('http://127.0.0.1:8080/generate_links?user_id=$id').then((http.Response response) {
      urlsList = (jsonDecode(response.body) as List<dynamic>).cast<String>();

      for (int i = 0 ; i < urlsList.length; i++){
        switch(i) {
          case 0: {
            print(urlsList[i]);
            gamblingController.text = urlsList[0];
            setState(() {

            });
            break;
          }

          case 1: {
            print(urlsList[i]);
          bettingController.text = urlsList[1];
            setState(() {

            });
            break;
        }

          case 2: {
            print(urlsList[i]);
            datingController.text = urlsList[2];
            setState(() {

            });
            break;
          }

          case 3: {
            print(urlsList[i]);
            nutraController.text = urlsList[3];
            setState(() {

            });
            break;
          }

          case 4: {
            print(urlsList[i]);
            cryptoController.text = urlsList[4];
            setState(() {

            });
            break;
          }

          default: {
            break;
          }
        }
      }

    }).catchError((e){
      print(e);
    });
  }
}
