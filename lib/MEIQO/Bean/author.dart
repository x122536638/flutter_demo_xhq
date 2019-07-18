
class Author {

  String name;

	Author.fromJsonMap(Map<String, dynamic> map): 
		name = map["name"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = name;
		return data;
	}
}
