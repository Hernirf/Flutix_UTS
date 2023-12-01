class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterUrl;
  // final List<Map<String, dynamic>> genres;
  // final List<Map<String, dynamic>> actors;
  // final double rating;

  Movie({
    this.id =0,
    this.title ='',
    this.overview ='',
    this.posterUrl ='',
    // required this.genres, 
    // required this.actors, 
    // required this.rating
  });


  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterUrl: json['posterUrl'],
      // genres: List.from(json['genres']),
      // actors: List.from(json['credits']['cast']),
      // rating: json['vote_average'],

    );
  }
}