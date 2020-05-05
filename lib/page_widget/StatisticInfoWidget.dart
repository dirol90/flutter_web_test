import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web/web_stats/MainWebSettings.dart';

class StatisticWidget extends StatefulWidget {

  bool isMobile;

  StatisticWidget(this.isMobile);

  @override
  _StatisticWidgetState createState() => _StatisticWidgetState();
}

class _StatisticWidgetState extends State<StatisticWidget> {

  var listPeriods = ['TODAY', 'YESTERDAY', 'LAST 7 DAYS', 'LAST MONTH', 'ALL TIME'];
  var listUsers = ['NEW USERS', 'ALL USERS'];

  var selectedPeriodIndex = 0;
  var selectedUsersIndex = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> listUsersWidgets = List();
    List<Widget> listPeriodWidgets = List();

    for(int i = 0 ; i < listPeriods.length; i++){
      listPeriodWidgets.add(
        GestureDetector(
          onTap: (){
            selectedPeriodIndex = i;
            setState(() {
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: myBoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  listPeriods[i],
                  style: selectedPeriodIndex == i ? TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:  Color(0xfffbb448), decoration: TextDecoration.underline,)
                      : TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      );
    }


    for(int i = 0 ; i < listUsers.length; i++){
      listUsersWidgets.add(
        GestureDetector(
          onTap: (){
            selectedUsersIndex = i;
            setState(() {
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: myBoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  listUsers[i],
                  style:  selectedUsersIndex == i ? TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:  Color(0xfffbb448), decoration: TextDecoration.underline,)
                      : TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(left: widget.isMobile ? 50 : 300, top: 100),
      child: Container(
        width: MediaQuery.of(context).size.width - (widget.isMobile ? 50 : 300) ,
        child: Container(
          child:  widget.isMobile ?
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: myBoxDecoration(),
                width: 440,
                height: 300,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:
                        listPeriodWidgets,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:
                        listUsersWidgets,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          getTextLine('${listPeriods[selectedPeriodIndex]} ${listUsers[selectedUsersIndex]} (GAMBLING):', 0),
                          getTextLine('${listPeriods[selectedPeriodIndex]} ${listUsers[selectedUsersIndex]} (BETTING ):', 0),
                          getTextLine('${listPeriods[selectedPeriodIndex]} ${listUsers[selectedUsersIndex]} (DATING  ):', 0),
                          getTextLine('${listPeriods[selectedPeriodIndex]} ${listUsers[selectedUsersIndex]} (NUTRA   ):', 0),
                          getTextLine('${listPeriods[selectedPeriodIndex]} ${listUsers[selectedUsersIndex]} (CRYPTO  ):', 0),

                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ) :
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: myBoxDecoration(),
                width: 440,
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:
                            listPeriodWidgets,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:
                            listUsersWidgets,
                          ),
                        ],
                      ),
                    ),
                    getTextLine('${listPeriods[selectedPeriodIndex]} ${listUsers[selectedUsersIndex]}  (GAMBLING):', 0),
                    getTextLine('${listPeriods[selectedPeriodIndex]} ${listUsers[selectedUsersIndex]}  (BETTING ):', 0),
                    getTextLine('${listPeriods[selectedPeriodIndex]} ${listUsers[selectedUsersIndex]}  (DATING  ):', 0),
                    getTextLine('${listPeriods[selectedPeriodIndex]} ${listUsers[selectedUsersIndex]}  (NUTRA   ):', 0),
                    getTextLine('${listPeriods[selectedPeriodIndex]} ${listUsers[selectedUsersIndex]}  (CRYPTO  ):', 0),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getTextLine(text, value){
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 4.0, top: 8, bottom: 8, right: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(width:250,
                  child: Text(text, style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),)),
              Container(width: 150,
                  child: Center(child: Text('$value', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),))),
            ],
          ),
        ),
      ],
    );
  }


  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width: 3, color: Color(0xfffbb448)),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    );
  }
}
