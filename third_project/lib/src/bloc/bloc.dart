import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
	// Single
	// final _email = StreamController<String>();
	// final _password = StreamController<String>();
	// 
	// Broadcast
	// final _email = StreamController<String>.broadcast();
	// final _password = StreamController<String>.broadcast();
	// 
	// Behavior Subject
	final _email = BehaviorSubject<String>();
	final _password = BehaviorSubject<String>();

	// Add data to stream
	Stream<String> get email => _email.stream.transform(validateEmail);
	Stream<String> get password => _password.stream.transform(validatePassword);
	// 
	// Combine stream in RxDart
	// Stream<bool>: Get true/false value to allow combine
	// e: email
	// p: password
	Stream<bool> get submitValid => 
		CombineLatestStream.combine2(email, password, (e, p) => true);

	// Change data
	Function(String) get changeEmail => _email.sink.add;
	Function(String) get changePassword => _password.sink.add;

	// Submit
	submit() {
		final validEmail = _email.value;
		final validPassword = _password.value;

		print('valid email is $validEmail');
		print('valid password is $validPassword');
	}

	// Clean-up different variable and objects
	dispose() {
		_email.close();
		_password.close();
	}
}

// Global instance
// final bloc = Bloc();