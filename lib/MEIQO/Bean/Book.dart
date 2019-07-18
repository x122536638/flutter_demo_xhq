import 'package:flutter_app_xhq1/MEIQO/Bean/rating.dart';
import 'package:flutter_app_xhq1/MEIQO/Bean/author.dart';
import 'package:flutter_app_xhq1/MEIQO/Bean/attrs.dart';
import 'package:flutter_app_xhq1/MEIQO/Bean/tags.dart';

class Book {

  String id;
  String alt;
  Rating rating;
  List<Author> author;
  String alt_title;
  String image;
  String title;
  String mobile_link;
  String summary;
  Attrs attrs;
  List<Tags> tags;

	Book.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		alt = map["alt"],
		rating = Rating.fromJsonMap(map["rating"]),
		author = List<Author>.from(map["author"].map((it) => Author.fromJsonMap(it))),
		alt_title = map["alt_title"],
		image = map["image"],
		title = map["title"],
		mobile_link = map["mobile_link"],
		summary = map["summary"],
		attrs = Attrs.fromJsonMap(map["attrs"]),
		tags = List<Tags>.from(map["tags"].map((it) => Tags.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['alt'] = alt;
		data['rating'] = rating == null ? null : rating.toJson();
		data['author'] = author != null ? 
			this.author.map((v) => v.toJson()).toList()
			: null;
		data['alt_title'] = alt_title;
		data['image'] = image;
		data['title'] = title;
		data['mobile_link'] = mobile_link;
		data['summary'] = summary;
		data['attrs'] = attrs == null ? null : attrs.toJson();
		data['tags'] = tags != null ? 
			this.tags.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
