import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web/web_stats/MainWebSettings.dart';

class FAQWidget extends StatefulWidget {

  bool isMobile;

  FAQWidget(this.isMobile);

  @override
  _FAQWidgetState createState() => _FAQWidgetState();
}

class _FAQWidgetState extends State<FAQWidget> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width > 1280 ? 300 : 50, top: 80),
      child: Stack(
        children: <Widget>[
        ],
      ),
    );
  }
}
