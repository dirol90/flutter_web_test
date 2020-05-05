import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web/web_stats/MainWebSettings.dart';

class PushNotificationWidget extends StatefulWidget {
  bool isMobile;

  PushNotificationWidget(this.isMobile);

  @override
  _PushNotificationWidgetState createState() => _PushNotificationWidgetState();
}

class _PushNotificationWidgetState extends State<PushNotificationWidget> {

  TextEditingController titlePushController ;
  TextEditingController bodyPushController ;

  @override
  void dispose() {
    titlePushController.dispose();
    bodyPushController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (titlePushController == null) {titlePushController = TextEditingController(); titlePushController.text = '';}
    if (bodyPushController == null) {bodyPushController = TextEditingController(); bodyPushController.text = '';}


    return  Padding(
      padding: EdgeInsets.only(left: widget.isMobile?  50 : 300, top: 100),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    strokeWidget('Title text: ', titlePushController.text, false, 0),
                    strokeWidget('Body text: ', bodyPushController.text, false, 1),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        child: Center(
                          child: Text('Select applicaion for push notification sending', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),)
                        ),
                      ),
                    ),
                    getTableWithSelectors(),
                    generateUriBtn(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget strokeWidget(name, value, isPassword, index){

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 416,
        child: widget.isMobile ?
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: 100,
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            index == 0 ? Container(
              width: 300,
              height: 60,
              decoration: myBoxDecoration(),
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                TextField(
                    controller:  index == 1 ? bodyPushController : titlePushController,
                    obscureText: isPassword,
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,)),
              ),
            ) : Container(
              width: 300,
              height: 300,
              decoration: myBoxDecoration(),
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                TextField(
                    controller:  index == 1 ? bodyPushController : titlePushController,
                    obscureText: isPassword,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,)),
              ),
            ),
          ],
        ) :
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: 100,
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            index == 0 ? Container(
              width: 300,
              height: 60,
              decoration: myBoxDecoration(),
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                TextField(
                    controller:  index == 1 ? bodyPushController : titlePushController,
                    obscureText: isPassword,
                    maxLines: 1,
                    decoration: InputDecoration(
                        border: InputBorder.none,)),
              ),
            ) : Container(
              width: 300,
              height: 300,
              decoration: myBoxDecoration(),
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                TextField(
                    controller:  index == 1 ? bodyPushController : titlePushController,
                    obscureText: isPassword,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: InputBorder.none,)),
              ),
            ),
          ],
        ),
      )
    );
  }

  var isSelected1 = true;
  var isSelected2 = false;
  var isSelected3 = false;
  var isSelected4 = false;
  var isSelected5 = false;

  Widget getTableWithSelectors(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: widget.isMobile?
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('GAMBPLING APP (${MainWebSettings.pushGamblingDayPrice}\$ per order)', style: TextStyle(fontSize: 14, color: Colors.black)),
                    Checkbox(onChanged: (val) {
                      isSelected1 = val;
                      setState(() {});
                    }, value: isSelected1,)
                  ],
                )
            ),
            Container(
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('DATING APP (${MainWebSettings.pushDatingDayPrice}\$ per order)', style: TextStyle(fontSize: 14, color: Colors.black)),
                    Checkbox(onChanged: (val) {
                      isSelected2 = val;
                      setState(() {});
                    }, value: isSelected2,)
                  ],
                )
            ),
            Container(
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('BETTING APP (${MainWebSettings.pushBettingDayPrice}\$ per order)', style: TextStyle(fontSize: 14, color: Colors.black)),
                    Checkbox(onChanged: (val) {
                      isSelected3 = val;
                      setState(() {});
                    }, value: isSelected3,)
                  ],
                )
            ),
            Container(
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('NUTRA APP (${MainWebSettings.pushNutraDayPrice}\$ per order)', style: TextStyle(fontSize: 14, color: Colors.black)),
                    Checkbox(onChanged: (val) {
                      isSelected4 = val;
                      setState(() {});
                    }, value: isSelected4,)
                  ],
                )
            ),
            Container(
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('CRYPTO APP (${MainWebSettings.pushCryptoDayPrice}\$ per order)', style: TextStyle(fontSize: 14, color: Colors.black)),
                    Checkbox(onChanged: (val) {
                      isSelected5 = val;
                      setState(() {});
                    }, value: isSelected5,)
                  ],
                )
            ),
          ],
        ) :
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    child : Row(
                      children: <Widget>[
                        Text('GAMBPLING APP (${MainWebSettings.pushGamblingDayPrice}\$ per order)', style: TextStyle(fontSize: 14, color: Colors.black)),
                        Checkbox(onChanged: (val) {
                          isSelected1 = val;
                          setState(() {});
                        }, value: isSelected1,)
                      ],
                    )
                ),
                Container(
                    child : Row(
                      children: <Widget>[
                        Text('DATING APP (${MainWebSettings.pushDatingDayPrice}\$ per order)', style: TextStyle(fontSize: 14, color: Colors.black)),
                        Checkbox(onChanged: (val) {
                          isSelected2 = val;
                          setState(() {});
                        }, value: isSelected2,)
                      ],
                    )
                ),
              ],
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    child : Row(
                      children: <Widget>[
                        Text('BETTING APP (${MainWebSettings.pushBettingDayPrice}\$ per order)', style: TextStyle(fontSize: 14, color: Colors.black)),
                        Checkbox(onChanged: (val) {
                          isSelected3 = val;
                          setState(() {});
                        }, value: isSelected3,)
                      ],
                    )
                ),
                Container(
                    child : Row(
                      children: <Widget>[
                        Text('NUTRA APP (${MainWebSettings.pushNutraDayPrice}\$ per order)', style: TextStyle(fontSize: 14, color: Colors.black)),
                        Checkbox(onChanged: (val) {
                          isSelected4 = val;
                          setState(() {});
                        }, value: isSelected4,)
                      ],
                    )
                )
              ],
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    child : Row(
                      children: <Widget>[
                        Text('CRYPTO APP (${MainWebSettings.pushCryptoDayPrice}\$ per order)', style: TextStyle(fontSize: 14, color: Colors.black)),
                        Checkbox(onChanged: (val) {
                          isSelected5 = val;
                          setState(() {});
                        }, value: isSelected5,)
                      ],
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget generateUriBtn(){

    var spendPerDay = 0;

    if (isSelected1){spendPerDay += MainWebSettings.pushGamblingDayPrice;}
    if (isSelected2){spendPerDay += MainWebSettings.pushDatingDayPrice;}
    if (isSelected3){spendPerDay += MainWebSettings.pushBettingDayPrice;}
    if (isSelected4){spendPerDay += MainWebSettings.pushNutraDayPrice;}
    if (isSelected5){spendPerDay += MainWebSettings.pushCryptoDayPrice;}

    return Container(
      width: MediaQuery.of(context).size.width/ (widget.isMobile ? 1 : 5),
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
        'SEND PUSH ($spendPerDay\$ once)',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }


  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
          width: 3.0,
              color:  Color(0xfffbb448),
      ),
      borderRadius: BorderRadius.all(
          Radius.circular(16.0)
      ),
    );
  }

}
