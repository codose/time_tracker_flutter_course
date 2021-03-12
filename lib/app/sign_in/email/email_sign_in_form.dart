
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/common_widget/form_submit_button.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class EmailSignInform extends StatefulWidget {

  final AuthBase auth;

  const EmailSignInform({Key key, @required this.auth}) : super(key: key);
  @override
  _EmailSignInformState createState() => _EmailSignInformState();
}

enum EmailSignInformType {
  SIGN_IN, REGISTER
}

class _EmailSignInformState extends State<EmailSignInform> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  EmailSignInformType _emailSignInformType = EmailSignInformType.SIGN_IN;

  void _submit() {

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }

  void _toggleFormType(){
    setState(() {
      _emailSignInformType = _emailSignInformType == EmailSignInformType.SIGN_IN
          ? EmailSignInformType.REGISTER : EmailSignInformType.SIGN_IN;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  List<Widget> _buildChildren() {
    final primaryText = _emailSignInformType == EmailSignInformType.SIGN_IN
        ? 'Sign In' : 'Create an Account';

    final secondaryText = _emailSignInformType == EmailSignInformType.SIGN_IN
        ? 'No Account? Register' : 'Have an account? Sign In';

    return [
      TextField(
        controller: _emailController,
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'abc@abc.com',
        ),
      ),
      SizedBox(
        height: 8.0,
      ),
      TextField(
        controller: _passwordController,
        decoration: InputDecoration(labelText: 'Password'),
        obscureText: true,
      ),
      SizedBox(
        height: 16.0,
      ),
      FormSubmitButton(
        text: primaryText,
        onPressed: () {},
      ),
      SizedBox(
        height: 8.0,
      ),
      FlatButton(
        onPressed: _toggleFormType,
        child: Text(secondaryText),
      )
    ];
  }
}
