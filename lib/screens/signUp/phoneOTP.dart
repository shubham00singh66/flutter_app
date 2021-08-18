import 'package:flutter/material.dart';
import 'package:flutterapp/screens/signUp/form.dart';
import 'package:flutterapp/services/auth.dart';

const kTextDecoration = InputDecoration(
  hintText: 'Enter your password',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
);
Widget buttonWidget(
    String verificationId, BuildContext context, String password) {
  return Align(
    alignment: Alignment.center,
    child: SizedBox(
      child: MaterialButton(
          color: Colors.pink,
          splashColor: Colors.pink[800],
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          onPressed: () async {
            // print(password);
            await verifyOTP(verificationId, password, context);
          },
          child: Text('Next',
              style: Theme.of(context)
                  .primaryTextTheme
                  .button
                  .copyWith(fontWeight: FontWeight.w800, fontSize: 16))),
    ),
  );
}

Widget kdecoration(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
  );
}

class PhoneOTP extends StatefulWidget {
  const PhoneOTP({Key key, this.verificationId}) : super(key: key);
  static const String id = 'phoneOTP';
  final String verificationId;
  @override
  _PhoneOTPState createState() => _PhoneOTPState();
}

class _PhoneOTPState extends State<PhoneOTP> {
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<Object>(
          future: null,
          builder: (context, snapshot) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          'Verify your Phone Number',
                          style: TextStyle(
                            fontSize: 46.0,
                            color: Colors.blue[700],
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        'Check your Phone and enter',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.blue[700],
                          letterSpacing: 1.5,
                        ),
                      ),
                      Text(
                        'the verification code',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.blue[700],
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        'OTP',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.blue[700],
                          letterSpacing: 2.5,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        child: TextField(
                          textAlign: TextAlign.center,
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration:
                              kTextDecoration.copyWith(hintText: 'Enter OTP'),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        '                                        Re-Send OTP',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[500],
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      buttonWidget(widget.verificationId, context, password),
                    ]),
              ),
            );
          }),
    );
  }
}
