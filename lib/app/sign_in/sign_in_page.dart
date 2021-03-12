import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/email/email_sign_in_page.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_flutter_course/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;
  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
      // printDebug('UserId : ${userCredentials.uid}');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    Navigator.of(context).push(MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => EmailSignInPage(
        auth: auth,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracker"),
        elevation: 2.0,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Sign In",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 48.0),
          SizedBox(
            height: 8.0,
          ),
          SocialSignInButton(
            text: 'Sign in with Google',
            onPressed: _signInWithGoogle,
            textColor: Colors.black87,
            color: Colors.white,
            assetName: 'images/google-logo.png',
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            text: 'Sign in with Facebook',
            onPressed: () {},
            color: Color(0XFF334D92),
            textColor: Colors.white,
            assetName: 'images/facebook-logo.png',
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Sign in with Email',
            onPressed: () => _signInWithEmailAndPassword(context),
            color: Colors.teal[700],
            textColor: Colors.white,
          ),
          SizedBox(height: 8.0),
          Text(
            'or',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Go Anonymous',
            onPressed: _signInAnonymously,
            color: Colors.lime[400],
            textColor: Colors.black87,
          ),
        ],
      ),
    );
  }
}
