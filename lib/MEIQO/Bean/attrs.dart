
class Attrs {

  List<String> publisher;
  List<String> pubdate;
  List<String> author;
  List<String> price;
  List<String> title;
  List<String> binding;
  List<String> translator;
  List<String> pages;

	Attrs.fromJsonMap(Map<String, dynamic> map): 
		publisher = List<String>.from(map["publisher"]),
		pubdate = List<String>.from(map["pubdate"]),
		author = List<String>.from(map["author"]),
		price = List<String>.from(map["price"]),
		title = List<String>.from(map["title"]),
		binding = List<String>.from(map["binding"]),
		translator = List<String>.from(map["translator"]),
		pages = List<String>.from(map["pages"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['publisher'] = publisher;
		data['pubdate'] = pubdate;
		data['author'] = author;
		data['price'] = price;
		data['title'] = title;
		data['binding'] = binding;
		data['translator'] = translator;
		data['pages'] = pages;
		return data;
	}
}
