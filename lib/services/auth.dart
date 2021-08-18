import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/signUp/phoneOTP.dart';
import '../screens/signUp/form.dart';

const String API_LINK = '127.0.0.1:8000';

Future sendOTP(String phone, BuildContext context) async {
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: '+91' + phone,
    timeout: Duration(seconds: 60),
    verificationCompleted: (PhoneAuthCredential credential) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignUpForm()));
    },
    verificationFailed: (FirebaseAuthException e) {
      if (e.code == 'invalid-phone-number') {
        print('The provided phone number is not valid.');
      }
    },
    codeSent: (String verificationId, int resendToken) {
      // Update the UI - wait for the user to enter the SMS code
      while (verificationId == null) {
        print('verId null');
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhoneOTP(verificationId: verificationId,),
        ),
      );
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
  );
}

Future verifyOTP(String verificationId, otp, BuildContext context) async {
  PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: verificationId, smsCode: otp);

  await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
  if (FirebaseAuth.instance.currentUser != null) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignUpForm()));
  }
}
