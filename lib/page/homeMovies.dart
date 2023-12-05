// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utsmobile/komponen/homeMoviesTile.dart';

import '../Olah_data.dart';
import '../api.dart';
import '../models/movie.dart';

class homeMovies extends StatelessWidget {
  homeMovies({super.key});

  List daftarMovies = [
    Movies(gambar: "asset/pp9.jpg"),
    Movies(gambar: "asset/pp10.jpg"),
    Movies(gambar: "asset/pp11.jpg"),
    Movies(gambar: "asset/pp12.jpeg")
  ];

  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    final data = Provider.of<olahData>(context, listen: false);
    final tmdbApi = Provider.of<TmdbApi>(context, listen: false);

    var id = data.idlogin;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: lebar,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 149, 0, 194),
              Color.fromARGB(255, 39, 26, 84),
            ],
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: [
                  StreamBuilder<DocumentSnapshot>(
                      stream: data.users.doc(id).snapshots(),
                      builder: (_, snapshot) {
                        return InkWell(
                          onTap: () {
                            print(snapshot.data!.get("urlPoto"));
                            print('tes');
                          },
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(snapshot.data!.get("urlPoto")),
                            radius: 30,
                          ),
                        );
                      }),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder<DocumentSnapshot>(
                          stream: data.users.doc(id).snapshots(),
                          builder: (_, snapshot) {
                            return Text(snapshot.data!.get("fullname"),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Railway',
                                  color: Colors.white,
                                ));
                          }),
                      StreamBuilder<DocumentSnapshot>(
                          stream: data.users.doc(id).snapshots(),
                          builder: (_, snapshot) {
                            return Text(
                                'Rp.' + snapshot.data!.get("saldo").toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Railway',
                                  color: Colors.white,
                                ));
                          }),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Row(children: [
                Text(
                  'Now Playing',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Railway',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.grey,
                        offset: Offset(1, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 15,
            ),
            FutureBuilder(
                future: tmdbApi.fetchNowPlayingMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<Movie> movies = snapshot.data!;
                    return Container(
                      height: 130,
                      width: 250,
                      child: Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movies.length,
                            itemBuilder: (context, index) {
                              return homeMoviesTile(
                                movies: movies[index],
                              );
                            }),
                      ),
                    );
                  }
                }),
            const SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Row(children: [
                Text(
                  'Movies Category',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Railway',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.grey,
                        offset: Offset(1, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Icon(
                          Icons.handshake,
                          color: Colors.white,
                          size: 65,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Action",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Railway',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Icon(
                          Icons.map_outlined,
                          color: Colors.white,
                          size: 65,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Adventure",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Railway',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Icon(
                          Icons.heart_broken_rounded,
                          color: Colors.white,
                          size: 65,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Romance",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Railway',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Icon(
                          Icons.person_4,
                          color: Colors.white,
                          size: 65,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Horror",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Railway',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Row(children: [
                Text(
                  'Coming Soon',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Railway',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.grey,
                        offset: Offset(1, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                )
              ]),
            ),
            SizedBox(height: 10),
            FutureBuilder(
                future: tmdbApi.fetchComingSoonMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<Movie> movies = snapshot.data!;
                    return Container(
                      height: 130,
                      width: 250,
                      child: Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movies.length,
                            itemBuilder: (context, index) {
                              return homeMoviesTile(
                                movies: movies[index],
                              );
                            }),
                      ),
                    );
                  }
                }),
            SizedBox(
              height: 70,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage(
                      'asset/diskon.jpg'), // Ganti dengan path gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.all(25),
              height: 120,
              // child: Image.asset("asset/diskon.jpg", fit: BoxFit.cover,),
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}

class Movies {
  String gambar;

  Movies({
    required this.gambar,
  });
}
