import 'package:flutter/material.dart';
import 'package:flutterapp/common/commonTextField.dart';
import 'package:flutterapp/screens/signUp/form.dart';
import 'package:hexcolor/hexcolor.dart';

class EmailVerify extends StatefulWidget {
  EmailVerify({Key key}) : super(key: key);

  @override
  _EmailVerifyState createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 48),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 206,
              ),
              Container(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Verify your Email',
                      style: TextStyle(
                        fontSize: 36,
                        color: HexColor('#303E72'),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Check your Email and enter the verification code',
                      style: TextStyle(
                        color: HexColor('#303E72').withOpacity(0.5),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 88,
              ),
              CommonTextField(
                label: 'OTP',
                obscureText: true,
                fontSize: 24.0,
                subText: '3:23',
              ),
              SizedBox(
                height: 114,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpForm(),
                      ),
                    );
                  },
                  child: Text('Next'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      HexColor('#ED1F85'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
