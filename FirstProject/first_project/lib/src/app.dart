// Import flutter helper library
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

// Create a class for custom widget
// This class must extend the 'StatelessWidget' base class
// This means does not require mutable state
class App extends StatefulWidget {
	@override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
	int counter = 0;
	List<ImageModel> images = [];

	void _fetchImage() async {
		counter++;
		// HTTP Request
		final url = Uri.https('jsonplaceholder.typicode.com', '/photos/$counter');
		final response = await get(url);
		final imageModel = ImageModel.fromJson(
			json.decode(
				response.body
			)
		);

		setState(() {
			images.add(imageModel);
		});
	}

	// Define a build method, with return the widget
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				appBar: AppBar(
					title: const Text('Hello World 1'),
				),
				body: ImageList(images),
				bottomNavigationBar: BottomAppBar(
					shape: const CircularNotchedRectangle(),
					child: Container(height: 50.0)
				),
				floatingActionButton: FloatingActionButton(
					// onPressed: () => setState(() {
					// 	counter++;
					// }),
					onPressed: _fetchImage,
					child: Icon(Icons.add),
				),
				floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
			),
		);
	}
}