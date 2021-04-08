import 'package:flutter/material.dart';

enum FormType {
	email, password
}

// ignore: must_be_immutable
class FormField extends StatelessWidget {
	final FormType type;
	final Function(String) pressHandler;
	final String errorText;
	late bool _obscureText;

	FormField(
		this.type, 
		this.pressHandler, 
		this.errorText, 
		style
	) {
		_obscureText = style['obscureText'];
	}

	@override
  Widget build(BuildContext context) {
    return TextField(
			obscureText: _obscureText,
			onChanged: pressHandler,
		);
  }
}
