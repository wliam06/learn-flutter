import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
	final List<ImageModel> images;

	ImageList(this.images);

	Widget build(BuildContext context) {
		return ListView.builder(
			itemCount: images.length,
			itemBuilder: (context, int index) {
				// construct new widget
				return buildImageContainer(images[index]);
			},
		);
	}

	Widget buildImageContainer(ImageModel image) {
		return Container(
			decoration: BoxDecoration(
				border: Border.all(color: Colors.grey),
			),
			margin: EdgeInsets.all(20),
			padding: EdgeInsets.all(20),
			child: buildColumn(image),
		);
	}

	Widget buildColumn(ImageModel image) {
		return Column(
			children: <Widget>[
				Padding(
					child: 
						Image.network(image.url),
						padding: EdgeInsets.only(
							bottom: 8,
						)
					),
					Text(image.title),
			],
		);
	}
}