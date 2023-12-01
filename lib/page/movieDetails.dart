// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utsmobile/Olah_data.dart';
import '../api.dart';
import '../models/movie.dart';

class movieDetails extends StatefulWidget {
  const movieDetails({super.key});

  @override
  State<movieDetails> createState() => _movieDetailsState();
}

class _movieDetailsState extends State<movieDetails> {
  @override
  Widget build(BuildContext context) {
    final tmdbApi = Provider.of<TmdbApi>(context, listen: false);
    final data = Provider.of<olahData>(context, listen: false);

    final Movie movie = tmdbApi.myMovie;
    
    return Scaffold(
      
      body:  SingleChildScrollView(
        child: Container(
              width: 360,
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
              child: Column(children: [
                Container(
                  child: Stack(
                    children: [
                     
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            ),
                            // ignore: prefer_interpolation_to_compose_strings
                            child: Image.network(movie.posterUrl, fit:BoxFit.cover ,),
                      ),
                       InkWell(onTap: (){
                      Navigator.pushNamed(context, '/bottomnav');
                    },child: Image.asset("asset/back.png"),),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        movie.title,
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'Railway',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.grey,
                              offset: Offset(1, 1),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Thriller - Indonesian',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Railway',
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(2, 2),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            size: 35,
                            color: Colors.blueAccent,
                          ),
                          Icon(
                            Icons.star,
                            size: 35,
                            color: Colors.blueAccent,
                          ),
                          Icon(
                            Icons.star,
                            size: 35,
                            color: Colors.blueAccent,
                          ),
                          Icon(
                            Icons.star,
                            size: 35,
                            color: Colors.blueAccent,
                          ),
                          Icon(Icons.star, size: 35, color: Colors.grey),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '4/5',
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Railway',
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                          ),
                          Text(
                            'Storyline',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Railway',
                              color: const Color.fromARGB(255, 105, 55, 242),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            movie.overview,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Railway',
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Cast',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Railway',
                              color: const Color.fromARGB(255, 105, 55, 242),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 70,
                                  width: 70,
                                  child: Image.asset("asset/pp5.jpg", fit: BoxFit.cover,),

                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Zack Arthur",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Railway',
                                      color: Color.fromARGB(255, 44, 86, 159)),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 70,
                                  width: 70,
                                  child: Image.asset("asset/pp6.jpg", fit: BoxFit.cover,),

                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Brad Oouref",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Railway',
                                      color: Color.fromARGB(255, 44, 86, 159)),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 70,
                                  width: 70,
                                  child: Image.asset("asset/pp7.jpg", fit: BoxFit.cover,),

                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Fiona Oourif",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Railway',
                                      color: Color.fromARGB(255, 44, 86, 159)),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 70,
                                  width: 70,
                                  child: Image.asset("asset/pp8.jpg", fit: BoxFit.cover,),

                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Jeniffer Tilly",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Railway',
                                      color: Color.fromARGB(255, 44, 86, 159)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/selectdate');
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF7015A8),
                            padding:
                                EdgeInsets.symmetric(horizontal: 90, vertical: 10),
                            elevation: 10),
                        child: Text(
                          "Continue to Book",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Railway',
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(1, 1),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
      )
    );
  }
}
