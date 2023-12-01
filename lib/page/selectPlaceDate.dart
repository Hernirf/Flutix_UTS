// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utsmobile/Booking_provider.dart';
import 'package:utsmobile/Olah_data.dart';

import '../api.dart';
import '../models/booking.dart';

class selectPlaceDate extends StatefulWidget {
  const selectPlaceDate({super.key});

  @override
  State<selectPlaceDate> createState() => _selectPlaceDateState();
}

class _selectPlaceDateState extends State<selectPlaceDate> {
  @override
  Widget build(BuildContext context) {
    final book = Provider.of<Bookingg>(context, listen: false);
    final data = Provider.of<olahData>(context, listen: false);
    final movie = Provider.of<TmdbApi>(context, listen: false);

    Booking bookMovie = book.myBooking;
    bookMovie.id_login = data.idlogin;
    bookMovie.posterUrl = movie.myMovie.posterUrl;
    bookMovie.judul_film = movie.myMovie.title;
    bookMovie.id_order = 'ID-${book.generateRandomId(8)}';

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/movedetails");
          },
          child: Image.asset("asset/back.png"),
        ),
        titleSpacing: 50,
        backgroundColor: Color.fromARGB(255, 149, 0, 194),
      ),
      body: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(' '),
                SizedBox(
                  height: 60,
                  width: 20,
                ),
                Text(
                  "Choose Date",
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Railway',
                      color: Color.fromARGB(255, 186, 165, 246),
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(1, 1),
                          blurRadius: 2,
                        ),
                      ],
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,  
              children: [
                GestureDetector(
                  
                  onTap: () {
                      bookMovie.tanggal = 'Saturday, 21 November 2023';
                  },
                  child: Column(
                    
                    children: [
                      Container(
                          width: 60,
                          height: 90,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "SAT",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Railway',
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "21",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Railway',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                      bookMovie.tanggal = 'Sunday, 22 November 2023';

                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 90,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "SUN",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Railway',
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "22",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Railway',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                      bookMovie.tanggal = 'Monday, 23 November 2023';

                  },
                  child: Column(
                    children: [
                      Container(
                          width: 60,
                          height: 90,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "MON",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Railway',
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "23",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Railway',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () { 
                      bookMovie.tanggal = 'Tuesday, 24 November 2023';

                
                  },
                  child: Column(
                    children: [
                      Container(
                          width: 60,
                          height: 90,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "TUE",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Railway',
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "24",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Railway',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 20,
                ),
                Text(
                  "Where to Watch ?",
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Railway',
                      color: Color.fromARGB(255, 186, 165, 246),
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(1, 1),
                          blurRadius: 2,
                        ),
                      ],
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  height: 10,
                  width: 20,
                ),
                Text(
                  "CGV Samarinda Plaza Mall",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Railway',
                      color: Color.fromARGB(255, 186, 165, 246),
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(1, 1),
                          blurRadius: 2,
                        ),
                      ],
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceAround, 
              children: [
                GestureDetector(
                  onTap: () {
                      bookMovie.tempat = "CGV Samarinda Plaza Mall";
                      bookMovie.waktu = '16.00';
                  },
                  child: Column(
                    children: [
                      Container(
                          width: 80,
                          height: 45,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "16:00",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Railway',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                     bookMovie.tempat = "CGV Samarinda Plaza Mall";
                    bookMovie.waktu = '19.00';
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 45,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "19:00",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Railway',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                     bookMovie.tempat = "CGV Samarinda Plaza Mall";
                      bookMovie.waktu = '22.00';
                  },
                  child: Column(
                    children: [
                      Container(
                          width: 80,
                          height: 45,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "22:00",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Railway',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  height: 10,
                  width: 20,
                ),
                Text(
                  "XXI BIGMALL Samarinda",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Railway',
                      color: Color.fromARGB(255, 186, 165, 246),
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(1, 1),
                          blurRadius: 2,
                        ),
                      ],
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceAround, 
              children: [
                GestureDetector(
                  onTap: () {
                      bookMovie.tempat = "XXI BIGMALL Samarinda";
                      bookMovie.waktu = '16.00';
                  },
                  child: Column(
                    children: [
                      Container(
                          width: 80,
                          height: 45,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "16:00",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Railway',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                      bookMovie.tempat = "XXI BIGMALL Samarinda";
                      bookMovie.waktu = '19.00';
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 45,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "19:00",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Railway',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                       bookMovie.tempat = "XXI BIGMALL Samarinda";
                      bookMovie.waktu = '22.00';
                  },
                  child: Column(
                    children: [
                      Container(
                          width: 80,
                          height: 45,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "22:00",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Railway',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  height: 10,
                  width: 20,
                ),
                Text(
                  "XXI City Centrum Samarinda",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Railway',
                      color: Color.fromARGB(255, 186, 165, 246),
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(1, 1),
                          blurRadius: 2,
                        ),
                      ],
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceAround,  
              children: [
                GestureDetector(
                  onTap: () {
                      bookMovie.tempat = "XXI City Centrum Samarinda";
                      bookMovie.waktu = '16.00';
                  },
                  child: Column(
                    children: [
                      Container(
                          width: 80,
                          height: 45,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "16:00",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Railway',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                     bookMovie.tempat = "XXI City Centrum Samarinda";
                      bookMovie.waktu = '19.00';
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 45,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "19:00",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Railway',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                      bookMovie.tempat = "XXI City Centrum Samarinda";
                      bookMovie.waktu = '22.00';
                  },
                  child: Column(
                    children: [
                      Container(
                          width: 80,
                          height: 45,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "22:00",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Railway',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SizedBox(
                  width: 35,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context,'/movedetails');
                  },
                  child: Text(
                    "Continue to Select Seat",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Railway',
                      color: Colors.deepPurple,  
                      
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_circle_right_rounded),
                  color: Colors.blue,
                  iconSize: 40,
                  onPressed: () {
                    Navigator.pushNamed(context,'/selectseat');
                    // print(bookMovie.id_order);

                    setState(() {});
                  }, 
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
