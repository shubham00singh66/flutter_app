import 'package:flutter/material.dart';
import 'package:flutterapp/common/commonTextField.dart';
import 'package:flutterapp/common/dots.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({Key key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final PageController controller = PageController(initialPage: 0);
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 72),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      SizedBox(height: 140,),
                      Container(
                        width: 220,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 72,
                                color: HexColor('#303E72'),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Existing member ?',
                                style: TextStyle(
                                  color: HexColor('#303E72').withOpacity(0.5),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 72,
                      ),
                      Form(
                        key: _formKey1,
                        child: Column(
                          children: [
                            CommonTextField(
                              label: 'Name',
                            ),
                            CommonTextField(
                              label: 'Username',
                              subText:
                                  '*Only alphabets, numbers, and _ are allowed in username',
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.animateToPage(
                              1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          child: Text('Next'),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  HexColor('#ED1F85'))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 72),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 140,),
                      Container(
                        width: 220,
                        height: 224,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 72,
                                color: HexColor('#303E72'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 72,
                      ),
                      Form(
                        key: _formKey2,
                        child: Column(
                          children: [
                            CommonTextField(
                              label: 'Create password',
                              obscureText: true,
                            ),
                            CommonTextField(
                              label: 'Confirm Pasword',
                              obscureText: true,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              controller.animateToPage(
                                0,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                            child: Text('Back'),
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                BorderSide(
                                    width: 2, color: HexColor('#ED1F85')),
                              ),
                              foregroundColor: MaterialStateProperty.all(
                                HexColor('#ED1F85'),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Finish'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                HexColor('#ED1F85'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          new Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: new Container(
              padding: const EdgeInsets.all(20.0),
              child: new Center(
                child: new DotsIndicator(
                  controller: controller,
                  itemCount: 2,
                  color: HexColor('#ED1F85'),
                  onPageSelected: (int page) {
                    controller.animateToPage(
                      page,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
