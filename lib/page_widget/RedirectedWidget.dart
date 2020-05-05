import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web/web_stats/MainWebSettings.dart';

import 'package:http/http.dart' as http;
import 'package:clippy/browser.dart' as clippy;

class RedirectedWidget extends StatefulWidget {

  bool isMobile;

  RedirectedWidget(this.isMobile);

  @override
  _RedirectedWidgetState createState() => _RedirectedWidgetState();
}

class _RedirectedWidgetState extends State<RedirectedWidget> {

  @override
  void dispose() {
    super.dispose();
  }

  var isShowURIs = false;
  List<String> urlsList = List();
  Widget linksWidget;


  var isSelected1 = true;
  var isSelected2 = false;
  var isSelected3 = false;
  var isSelected4 = false;
  var isSelected5 = false;


  var isEdited = false;
  var editedIndex = -1;
  TextEditingController gamblingController;
  TextEditingController bettingController;
  TextEditingController datingController;
  TextEditingController nutraController;
  TextEditingController cryptoController;

  @override
  Widget build(BuildContext context) {

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                isShowURIs ? linksWidget : Container(
                  child: Column(
                    children: <Widget>[
                      strokeWidget('GAMBLING PARTNER LINK: ', '', false, 0, true),
                      strokeWidget('BETTING PARTNER LINK: ', '', false, 1, true),
                      strokeWidget('DATING PARTNER LINK: ', '', false, 2, true),
                      strokeWidget('NUTRA PARTNER LINK: ', '', false, 3, true),
                      strokeWidget('CRYPTO PARTNER LINK: ', '', false, 4, true),
                    ],
                  ),
                ),
              getTableWithSelectors(),
              generateUriBtn(),
            ],
            ),
            ),
          )
        ],
      ),
    );
  }


  Widget getTableWithSelectors() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: widget.isMobile ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        'GAMBPLING APP (${MainWebSettings.gamblingDayPrice}\$ per day)',
                        style: TextStyle(fontSize: 14, color: Colors.black)),
                    Checkbox(
                      onChanged: (val) {
                        isSelected1 = val;
                        setState(() {});
                      },
                      value: isSelected1,
                    )
                  ],
                )),
            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        'DATING APP (${MainWebSettings.datingDayPrice}\$ per day)',
                        style: TextStyle(fontSize: 14, color: Colors.black)),
                    Checkbox(
                      onChanged: (val) {
                        isSelected2 = val;
                        setState(() {});
                      },
                      value: isSelected2,
                    )
                  ],
                )),
            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        'BETTING APP (${MainWebSettings.bettingDayPrice}\$ per day)',
                        style: TextStyle(fontSize: 14, color: Colors.black)),
                    Checkbox(
                      onChanged: (val) {
                        isSelected3 = val;
                        setState(() {});
                      },
                      value: isSelected3,
                    )
                  ],
                )),
            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        'NUTRA APP (${MainWebSettings.nutraDayPrice}\$ per day)',
                        style: TextStyle(fontSize: 14, color: Colors.black)),
                    Checkbox(
                      onChanged: (val) {
                        isSelected4 = val;
                        setState(() {});
                      },
                      value: isSelected4,
                    )
                  ],
                )),
            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        'CRYPTO APP (${MainWebSettings.cryptoDayPrice}\$ per day)',
                        style: TextStyle(fontSize: 14, color: Colors.black)),
                    Checkbox(
                      onChanged: (val) {
                        isSelected5 = val;
                        setState(() {});
                      },
                      value: isSelected5,
                    )
                  ],
                )),
          ],
        ):  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            'GAMBPLING APP (${MainWebSettings.gamblingDayPrice}\$ per day)',
                            style: TextStyle(fontSize: 14, color: Colors.black)),
                        Checkbox(
                          onChanged: (val) {
                            isSelected1 = val;
                            setState(() {});
                          },
                          value: isSelected1,
                        )
                      ],
                    )),
                Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            'DATING APP (${MainWebSettings.datingDayPrice}\$ per day)',
                            style: TextStyle(fontSize: 14, color: Colors.black)),
                        Checkbox(
                          onChanged: (val) {
                            isSelected2 = val;
                            setState(() {});
                          },
                          value: isSelected2,
                        )
                      ],
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            'BETTING APP (${MainWebSettings.bettingDayPrice}\$ per day)',
                            style: TextStyle(fontSize: 14, color: Colors.black)),
                        Checkbox(
                          onChanged: (val) {
                            isSelected3 = val;
                            setState(() {});
                          },
                          value: isSelected3,
                        )
                      ],
                    )),
                Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            'NUTRA APP (${MainWebSettings.nutraDayPrice}\$ per day)',
                            style: TextStyle(fontSize: 14, color: Colors.black)),
                        Checkbox(
                          onChanged: (val) {
                            isSelected4 = val;
                            setState(() {});
                          },
                          value: isSelected4,
                        )
                      ],
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            'CRYPTO APP (${MainWebSettings.cryptoDayPrice}\$ per day)',
                            style: TextStyle(fontSize: 14, color: Colors.black)),
                        Checkbox(
                          onChanged: (val) {
                            isSelected5 = val;
                            setState(() {});
                          },
                          value: isSelected5,
                        )
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget generateUriBtn() {
    var spendPerDay = 0;

    if (isSelected1) {
      spendPerDay += MainWebSettings.gamblingDayPrice;
    }
    if (isSelected2) {
      spendPerDay += MainWebSettings.datingDayPrice;
    }
    if (isSelected3) {
      spendPerDay += MainWebSettings.bettingDayPrice;
    }
    if (isSelected4) {
      spendPerDay += MainWebSettings.nutraDayPrice;
    }
    if (isSelected5) {
      spendPerDay += MainWebSettings.cryptoDayPrice;
    }

    return GestureDetector(
      onTap: () async {
        isShowURIs = true;
        await getLinks('1234567890');
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.of(context).size.width / (widget.isMobile ? 1 : 5),
          height: 75,
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
            'GENERATE LINK(s) ($spendPerDay\$ per day)',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isEdited = !isEdited;
                        editedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: isEditable ? Icon(
                            isEdited && editedIndex == index
                                ? Icons.save
                                : (isSelected1 && index == 0) ? Icons.edit : (isSelected2 && index == 1) ? Icons.edit : (isSelected3 && index == 2) ? Icons.edit :  (isSelected4 && index == 3) ? Icons.edit : (isSelected5 && index == 4) ? Icons.edit : Icons.lock,
                            size: 24,
                            color: Color(0xfffbb448),
                          ) : GestureDetector(
                            onTap: () {
                              setState(() async {
                                await clippy.write(9999999999.toString()); // USER ID
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    if ((isSelected1 && index == 0) || (isSelected2 && index == 1) || (isSelected3 && index == 2) || (isSelected4 && index == 3) || (isSelected5 && index == 4)){
                    isEdited = !isEdited;
                    editedIndex = index;}
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child:  isEditable ? Icon(
                        isEdited && editedIndex == index
                            ? Icons.save
                            : (isSelected1 && index == 0) ? Icons.edit : (isSelected2 && index == 1) ? Icons.edit : (isSelected3 && index == 2) ? Icons.edit :  (isSelected4 && index == 3) ? Icons.edit : (isSelected5 && index == 4) ? Icons.edit : Icons.lock,
                        size: 24,
                        color: Color(0xfffbb448),
                      ) : GestureDetector(
                        onTap: () {
                          setState(() async {
                            await clippy.write(9999999999.toString()); // USER ID
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
                ),
              )
            ],
          ),
        ));
  }

  Future getLinks(id) async {
    await http.get('http://127.0.0.1:8080/generate_links?user_id=$id').then((http.Response response) {
      urlsList = (jsonDecode(response.body) as List<dynamic>).cast<String>();

      var widgetsUrlsList = List<Widget>();

      urlsList.forEach((val){
        widgetsUrlsList.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: SelectableText(val, style: TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),),
        ));
      });

      linksWidget = Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: widgetsUrlsList,),
      );
      setState(() {});
    }).catchError((e){
      print(e);
    });
  }
}
