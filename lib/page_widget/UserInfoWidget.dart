import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:clippy/browser.dart' as clippy;

class UserInfoWidget extends StatefulWidget {
  bool isMobile;

  UserInfoWidget(this.isMobile);

  @override
  _UserInfoWidgetState createState() => _UserInfoWidgetState();
}

class _UserInfoWidgetState extends State<UserInfoWidget> {
  TextEditingController passwordController;
  TextEditingController emailController;
  TextEditingController fbIdController;
  TextEditingController userNameController;
  TextEditingController telegramUserNameController;

  @override
  void dispose() {
    passwordController.dispose();
    fbIdController.dispose();
    emailController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (fbIdController == null) {
      fbIdController = TextEditingController();
      fbIdController.text = '';
    }
    if (userNameController == null) {
      userNameController = TextEditingController();
      userNameController.text = 'ALEX';
    }
    if (emailController == null) {
      emailController = TextEditingController();
      emailController.text = 'ALEX@alex.com';
    }
    if (passwordController == null) {
      passwordController = TextEditingController();
      passwordController.text = 'QWERty12345';
    }
    if (telegramUserNameController == null) {
      telegramUserNameController = TextEditingController();
      telegramUserNameController.text = '@ALEX';
    }

    return Padding(
      padding: EdgeInsets.only(
          left: widget.isMobile ? 50 : 300, top: 100 ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              child: Column(
                children: <Widget>[
                  strokeWidget('YOUR ID:', '9999999999', false, -1, false),
                  strokeWidget('FACEBOOK ADWERTISING ID:',  fbIdController.text, false, 0, true),
                  strokeWidget('USER NAME:', userNameController.text, false, 3, true),
                  strokeWidget('USER EMAIL:', emailController.text, false, 1, true),
                  strokeWidget('USER PASSWORD:', passwordController.text, true, 2, true),
                  strokeWidget('TELEGRAM USERNAME:', telegramUserNameController.text, false, 4, true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  var isEdited = false;
  var editedIndex = -1;

  Widget strokeWidget(name, value, isPassword, index, isEditable) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: widget.isMobile
              ? MediaQuery.of(context).size.width - 50
              : MediaQuery.of(context).size.width - 300,
          child: widget.isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: (widget.isMobile
                                ? MediaQuery.of(context).size.width - 50
                                : MediaQuery.of(context).size.width - 300) / 5 * 3,
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
                                      '${isPassword ? getPassword(value) : value}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                )
                                : TextField(
                                    controller: index == 4
                                        ? telegramUserNameController
                                        : index == 3
                                            ? userNameController
                                            : index == 2
                                                ? passwordController
                                                : index == 1
                                                    ? emailController
                                                    : fbIdController,
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
                                  : Icons.edit,
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
                                  '${isPassword ? getPassword(value) : value}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                )
                              : TextField(
                                  controller: index == 4
                                      ? telegramUserNameController
                                      : index == 3
                                          ? userNameController
                                          : index == 2
                                              ? passwordController
                                              : index == 1
                                                  ? emailController
                                                  : fbIdController,
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
                          isEdited = !isEdited;
                          editedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child:  isEditable ? Icon(
                              isEdited && editedIndex == index
                                  ? Icons.save
                                  : Icons.edit,
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

  String getPassword(value) {
    var s = '';
    for (int i = 0; i < value.toString().length; i++) {
      if (i == 0) {
        s += value.toString()[i];
      } else
        s += '*';
    }
    return s;
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width: 3.0, color: Color(0xfffbb448)),
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    );
  }
}
