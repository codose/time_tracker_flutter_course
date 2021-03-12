
import 'package:flutter/material.dart';

import 'custom_raised_button.dart';

class FormSubmitButton extends CustomRaisedButton {
  FormSubmitButton({
    @required String text,
    VoidCallback onPressed,
  })  : assert(text != null),
        super(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
          ),
        ),
        borderRadius: 8.0,
        onPressed: onPressed,
        color: Colors.indigo,
      );
}