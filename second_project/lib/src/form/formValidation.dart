class FormValidation {
	String? validateEmail(value) {
		// return null if valid
		// otherwise show error message if invalid
		if (value == null || value.isEmpty) {
			return 'Please enter some text';
		}
		
		if (!value.contains('@')) {
			return 'Please enter a valid email';
		}

		return null;
	}

	String? validatePassword(value) {
		if (value == null || value.isEmpty) {
			return 'Please enter some text';
		}

		if (value.length < 4) {
			return 'Password must be at least 4 characters';
		}
	}
}