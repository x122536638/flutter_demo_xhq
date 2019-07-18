
class Rating {

  int max;
  String average;
  int numRaters;
  int min;

	Rating.fromJsonMap(Map<String, dynamic> map): 
		max = map["max"],
		average = map["average"],
		numRaters = map["numRaters"],
		min = map["min"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['max'] = max;
		data['average'] = average;
		data['numRaters'] = numRaters;
		data['min'] = min;
		return data;
	}
}
