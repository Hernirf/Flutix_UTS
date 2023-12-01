// import 'package:flutter/material.dart';
// import 'api.dart';
// import 'komponen/homeMoviesTile.dart';
// import 'models/movie.dart';// Sesuaikan dengan nama file Anda

// class test extends StatelessWidget {
//   @override
//   final TmdbApi tmdbApi = TmdbApi('0135867d7964dd10abac7985b6d2f65c'); // Ganti dengan API key Anda

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Popular Movies'),
//         ),
//         body: FutureBuilder(
//           future: tmdbApi.fetchNowPlayingMovies(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else {
//               List<Movie> movies = snapshot.data!;
//               return ListView.builder(
//                 itemCount: movies.length,
//                 itemBuilder: (context, index) {
//                   return homeMoviesTile(
//                         movies: movies[index],
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
