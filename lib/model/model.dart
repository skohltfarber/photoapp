import 'package:meta/meta.dart';

class Movie {

  String title;
  String posterPath;
  String id;
  String overview;
  bool favored, isExpanded;

  Movie({
    @required this.title,
    @required this.posterPath,
    @required this.id,
    @required this.overview,
    this.favored,
    this.isExpanded,
  });

  Movie.fromJson(Map json) 
    : title = json["title"],
      posterPath = json["poster_path"],
      id = json["id"].toString(),
      overview = json["overview"],
      favored = false;

  Movie.fromDb(Map json) 
    : title = json["title"],
      posterPath = json["poster_path"],
      id = json["id"].toString(),
      overview = json["overview"],
      favored = json["favored"] == 1 ? true : false;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['title'] = title;
    map['poster_path'] = posterPath;
    map['overview'] = overview;
    map['favored'] = favored; 
    return map;
  }
}