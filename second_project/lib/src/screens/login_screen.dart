import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../form/formValidation.dart';

class LoginScreen extends StatefulWidget {
	@override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with FormValidation {
	final formKey = GlobalKey<FormState>();
	static String emailText = '';
	static String passwordText = '';

	Widget build(BuildContext context) {
		return Container(
			margin: EdgeInsets.all(20),
			child: Form(
				key: formKey,
				child: Column(
					children: [
						emailField(),
						passwordField(),
						Container(
							margin: EdgeInsets.only(
								top: 25
							)
						),
						submitButton(),
					],
				),
			),
		);
	}

	Widget emailField() {
		return TextFormField(
			keyboardType: TextInputType.emailAddress,
			decoration: InputDecoration(
				labelText: "Email address",
				hintText: "you@example.com",
			),
			validator: validateEmail,
			onSaved: (value) {
				if (!(value == null || value.isEmpty)) {
					emailText = value;
				}
			},
		);
	}

	Widget passwordField() {
		return Container (
			margin: EdgeInsets.only(
				bottom: 20
			),
			child: TextFormField(
				obscureText: true,
				decoration: InputDecoration(
					labelText: "Password",
					hintText: "Password",
				),
				validator: validatePassword,
				onSaved: (value) {
					if (!(value == null || value.isEmpty)) {
						passwordText = value;
					}
				},
			),
		);
	}

	Widget submitButton() {
		return TextButton(
			style: TextButton.styleFrom(
				primary: Colors.white,
				backgroundColor: Colors.blue,
			),
			onPressed: () {
				if (formKey.currentState?.validate() == true) {
					formKey.currentState?.save();
				}
			}, 
			child: Text(
				'Submit',
				style: TextStyle(fontSize: 14),
			));
	}
}