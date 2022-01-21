import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flash_chat_flutter/components/rounded_button.dart';
import 'package:flash_chat_flutter/screens/login_screen.dart';
import 'package:flash_chat_flutter/screens/registration_screen.dart';
import 'package:flash_chat_flutter/utilities/constants.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = '/';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

// Enable _WelcomeScreenState to act as Ticker provider using 'with'
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    // Initialize AnimationController and ColorTween
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("Firebase initializeApp() complete"); // setState(() {});
    });
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    animation =
        ColorTween(begin: Colors.grey, end: Colors.white).animate(controller);

    // Start controller in motion from 0.0 - 1.0
    controller.forward(from: 0.0);

    // 'Listen' to controller.value
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: kHeroTag,
                  child: Container(
                    child: Image.asset(kLogoPath),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                  totalRepeatCount: 4,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            // Login Button
            // RoundedButton(Colors.lightBlueAccent, LoginScreen.id, 'Log In'),
            RoundedButton(
              colour: Colors.lightBlueAccent,
              title: 'Log In',
              onPress: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            // Register Button
            RoundedButton(
              colour: Colors.blueAccent,
              title: 'Register',
              onPress: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
