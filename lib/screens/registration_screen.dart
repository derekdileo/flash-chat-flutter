import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_flutter/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_flutter/components/rounded_button.dart';
import 'package:flash_chat_flutter/utilities/constants.dart';
import 'package:flutter/services.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = '/registration-screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // Instantiate firebase auth instance
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: kHeroTag,
              child: Container(
                height: 200.0,
                child: Image.asset(kLogoPath),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            // Email entry
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your email',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            // Password entry
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your password',
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              colour: Colors.blueAccent,
              title: 'Register',
              onPress: () async {
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser.additionalUserInfo?.isNewUser != null) {
                    // print(newUser.additionalUserInfo?.username.toString());
                    print('Registration successful!');
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                } catch (e) {
                  print(e);
                  print('Email or password not accepted');

                  String alertTitle = '';
                  String promptText = '';
                  if (e.toString().contains('password')) {
                    alertTitle = 'Invalid Password';
                    promptText =
                        'Password must be at least six characters. \nPlease try again';
                  } else if (e.toString().contains('email')) {
                    alertTitle = 'Invalid Email Format';
                    promptText = 'Please try again';
                  }
                  _showMyDialog(alertTitle, promptText);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog(String alertTitle, String promptText) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(alertTitle),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(promptText),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
