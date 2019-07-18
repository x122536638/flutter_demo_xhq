
class Tags {

  int count;
  String name;

	Tags.fromJsonMap(Map<String, dynamic> map): 
		count = map["count"],
		name = map["name"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['count'] = count;
		data['name'] = name;
		return data;
	}
}
