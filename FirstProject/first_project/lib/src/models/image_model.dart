// static late means, the field or variable can't be initialized in the 
// declaration but will always be initialized before it's referenced
class ImageModel {
	// static late int id;
	// static late String url;
	// static late String title;
	late int id;
	late String url;
	late String title;
	
	ImageModel.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		url = json['url'];
		title = json['title'];
	}
	// 
	// 2
	// ImageModel.fromJson(Map<String, dynamic> json)
	// 	:
	// 		id = json['id'],
	// 		url = json['url'],
	// 		title = json['title'];
}