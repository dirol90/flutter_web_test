import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web/object/Payments.dart';
import 'package:flutter_web/web_stats/MainWebSettings.dart';

class PaymentsInfoWidget extends StatefulWidget {

  bool isMobile;

  PaymentsInfoWidget(this.isMobile);

  @override
  _PaymentsInfoWidgetState createState() => _PaymentsInfoWidgetState();
}

class _PaymentsInfoWidgetState extends State<PaymentsInfoWidget> {
  TextEditingController sumController;
  TextEditingController emailTelegrgamController;


  @override
  void dispose() {
    sumController.dispose();
    super.dispose();
  }


  var paymentsDataWidgets = List<Widget>();

  @override
  Widget build(BuildContext context) {
    if (sumController == null) {
      sumController = TextEditingController();
      emailTelegrgamController = TextEditingController();
      emailTelegrgamController.text = '\@ALEX';
      sumController.text = '50\$';
    }

    if (paymentsDataWidgets.isEmpty) {

      // TODO: LOAD FROM DATABASE PAYMENTS

      paymentsDataWidgets = List<Widget>();

//      for (int i = 0; i < 10; i++) {
//        var payment = Payment(
//            (12312414 + i).toString(),
//            (12312414 + i).toString(),
//            231,
//            DateTime
//                .now()
//                .millisecondsSinceEpoch,
//            false,
//            false,
//            'ADDED');
//
//        paymentsDataWidgets.add(
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Container(
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Text(payment.id),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Text(payment.dateMilliseconds.toString()),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Text(payment.paymentInfo),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Text(payment.sum.toString()),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Text(payment.isPayed.toString()),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Icon(Icons.delete),
//                    )
//                  ],
//                ),
//              ),
//            ));
//      }
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
                  'SET SUM IN USD(\$) TO CREATE A BILL \n(MIN 50 USD):',
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

                  // TODO: SAVE TO DATABASE PAYMENT

//                  paymentsDataWidgets.add(
//                      Padding(
//                        padding: const EdgeInsets.all(8.0),
//                        child: Container(
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            crossAxisAlignment: CrossAxisAlignment.center,
//                            children: <Widget>[
//                              Padding(
//                                padding: const EdgeInsets.all(8.0),
//                                child: Text(DateTime.now().millisecondsSinceEpoch.toString()),
//                              ),
//                              Padding(
//                                padding: const EdgeInsets.all(8.0),
//                                child: Text(DateTime.now().millisecondsSinceEpoch.toString()),
//                              ),
//                              Padding(
//                                padding: const EdgeInsets.all(8.0),
//                                child: Text(emailTelegrgamController.text),
//                              ),
//                              Padding(
//                                padding: const EdgeInsets.all(8.0),
//                                child: Text(sumController.text),
//                              ),
//                              Padding(
//                                padding: const EdgeInsets.all(8.0),
//                                child: Text(false.toString()),
//                              ),
//                              Padding(
//                                padding: const EdgeInsets.all(8.0),
//                                child: Icon(Icons.delete),
//                              )
//                            ],
//                          ),
//                        ),
//                      ));

                  setState(() {
                  });

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

    return Padding(
      padding: EdgeInsets.only(left:  widget.isMobile ?  50 : 300, bottom: 64),
      child: Stack(
        children: <Widget>[

          Align(
            alignment: Alignment.center,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: paymentsDataWidgets,
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => paymentDialog);
                },
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
                    'REQUEST INVOICE',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
}
