import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:utsmobile/models/booking.dart';
import 'models/movie.dart';
import 'package:flutter/material.dart';


class TmdbApi extends ChangeNotifier{
  final String apiKey='0135867d7964dd10abac7985b6d2f65c';
  final String baseUrl = 'https://api.themoviedb.org/3';



  TmdbApi();

  int _idmovie = 0;

  
  // Movie _MovieID = Movie();


  Future<List<Movie>> fetchNowPlayingMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/movie/now_playing?api_key=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> moviesData = data['results'];
      List<Movie> moviesList = [];

      for (var movie in moviesData) {
        moviesList.add(Movie(
          id: movie['id'],
          title: movie['title'],
          overview: movie['overview'],
          posterUrl: 'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
          // genres: movie['genres'],
          // actors: movie['credits']['cast'],
          // rating: movie['vote_average'],
        ));
      }

      return moviesList;

    } else {
      throw Exception('Failed to load popular movies');
    }

  }

  Future<List<Movie>> fetchComingSoonMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/movie/upcoming?api_key=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> moviesData = data['results'];
      List<Movie> moviesList = [];

      for (var movie in moviesData) {
        moviesList.add(Movie(
          id: movie['id'],
          title: movie['title'],
          overview: movie['overview'],
          posterUrl: 'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
          // genres: movie['genres'],
          // actors: movie['credits']['cast'],
          // rating: movie['vote_average'],
        ));
      }
      return moviesList;
    } else {
      throw Exception('Failed to load popular movies');
    }
  }

  Future<Movie> fetchMovieById(int movieId) async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Movie.fromJson(data);
    } else {
      throw Exception('Failed to load movie');
    }
  }

  void setData(int id){
    _idmovie = id;
    notifyListeners();
  }

  Movie _myMovie = Movie(); // Objek yang akan disimpan

  Movie get myMovie => _myMovie;

  

  


void setMovie(Movie newValue){
   _myMovie = newValue;
    notifyListeners();
}

  int get idmovie => _idmovie;

  Future<Map<String, dynamic>> fetchMovieDetails(int movieId) async {
    final apiUrl = 'https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey';
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}
