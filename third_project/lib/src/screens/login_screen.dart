import 'package:flutter/material.dart';
import '../bloc/bloc.dart';
import '../bloc/provider.dart';

class LoginScreen extends StatelessWidget {
	@override
  Widget build(BuildContext context) {
		final bloc = Provider.of(context);

    return Container(
			margin: EdgeInsets.all(20),
			child: Column(
				children: [
					emailField(bloc),
					passwordField(bloc),
					Container(
						margin: EdgeInsets.only(
							top: 25
						),
					),
					submitButton(bloc)
				],
			),
		);
  }

	Widget emailField(Bloc bloc) {
		return StreamBuilder(
			stream: bloc.email,
			builder: (context, snapshot) {
				// snapshot: represent the interaction with the stream.
				if (snapshot.hasError) {
					return TextField(
						onChanged: bloc.changeEmail,
						keyboardType: TextInputType.emailAddress,
						decoration: InputDecoration(
							hintText: 'you@example.com', 
							labelText: 'Email Address',
							errorText: snapshot.error.toString(),
						),
					);
				}

				return TextField(
					onChanged: bloc.changeEmail,
					keyboardType: TextInputType.emailAddress,
					decoration: InputDecoration(
						hintText: 'you@example.com', 
						labelText: 'Email Address',
					),
				);
				
			}
		);
	}

	Widget passwordField(Bloc bloc) {
		return StreamBuilder(
			stream: bloc.password,
			builder: (context, snapshot) {
				if (snapshot.hasError) {
					return TextField(	
						onChanged: bloc.changePassword,
						obscureText: true,
						decoration: InputDecoration(
							hintText: 'Password', 
							labelText: 'Password',
							errorText: snapshot.error.toString(),
						),
					);
				}

				return TextField(	
					onChanged: bloc.changePassword,
					obscureText: true,
					decoration: InputDecoration(
						hintText: 'Password', 
						labelText: 'Password'
					)
				);
			}
		);
	}

	void onPressed() {
		print('hi there');
	}

	Widget submitButton(Bloc bloc) {
		return StreamBuilder(
			stream: bloc.submitValid,
			builder: (context, snapshot) {
				return TextButton(
					onPressed: snapshot.hasData ? bloc.submit : null, 
					style: TextButton.styleFrom(
						primary: Colors.white,
						backgroundColor: Colors.blue
					),
					child: Text(
						'Login'
					)
				);
			},
		);
	}
}