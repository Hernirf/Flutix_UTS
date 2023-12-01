import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utsmobile/page/homeMovies.dart';

import '../api.dart';
import '../models/movie.dart';

class homeMoviesTile extends StatelessWidget {
  final Movie movies;
  homeMoviesTile({super.key, required this.movies});
  @override
  Widget build(BuildContext context) {
    final tmdbApi = Provider.of<TmdbApi>(context, listen: false);
    

    return GestureDetector(
      onTap: () {
        tmdbApi.setData(movies.id);
        tmdbApi.setMovie(movies);
        Navigator.pushNamed(context, "/movedetails");
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //gambar Resep
            Image.network(
              fit: BoxFit.cover,
              movies.posterUrl,
              height: 130,
              width: 220,
            ),
          ],
        ),
      ),
    );
  }
}
