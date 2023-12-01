// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utsmobile/Booking_provider.dart';
import 'package:utsmobile/Olah_data.dart';

import '../api.dart';
import '../models/booking.dart';
import '../models/movie.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    final tmdbApi = Provider.of<TmdbApi>(context, listen: false);
    final book = Provider.of<Bookingg>(context, listen: false);
    final data = Provider.of<olahData>(context, listen: false);
    String id = data.idlogin;
    final Movie movie = tmdbApi.myMovie;
     FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference users = db.collection("users");



    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
          Navigator.pushNamed(context, '/selectseat');

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
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Check details below",
                  style: TextStyle(
                      fontSize: 20,
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
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  "before checkout",
                  style: TextStyle(
                      fontSize: 20,
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
              height: 30,
            ),
            Row(
              children: [
                SizedBox(width: 30),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Image.network(book.myBooking.posterUrl, fit: BoxFit.cover),
                ),
                SizedBox(width: 20), 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     book.myBooking.judul_film,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Railway',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Horror - Korean",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Railway',
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 320,
                height: 5,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),

            //isi
            SizedBox(
              height: 12,
            ),

            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "ID Order",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Railway',
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      book.myBooking.id_order,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Railway',
                        color: Color.fromARGB(255, 186, 165, 246),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Cinema",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Railway',
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      book.myBooking.tempat,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Railway',
                        color: Color.fromARGB(255, 186, 165, 246),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Date & Time",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Railway',
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                     '${ book.myBooking.tanggal}, ${book.myBooking.waktu}',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Railway',
                        color: Color.fromARGB(255, 186, 165, 246),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Seat",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Railway',
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      book.myBooking.kursi,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Railway',
                        color: Color.fromARGB(255, 186, 165, 246),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Ticket",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Railway',
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      "Rp.30.000 x ${book.bangku.length}",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Railway',
                        color: Color.fromARGB(255, 186, 165, 246),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Fees",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Railway',
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 65,
                    ),
                    Text(
                      "Rp.4.000 x ${book.bangku.length}",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Railway',
                        color: Color.fromARGB(255, 186, 165, 246),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Railway',
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 65,
                    ),
                    Text(
                      "Rp.${30000*book.bangku.length + 4000*book.bangku.length}",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Railway',
                        color: Color.fromARGB(255, 186, 165, 246),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            Center(
              child: Container(
                width: 320,
                height: 5,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Saldo Wallet",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Railway',
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                StreamBuilder<DocumentSnapshot>(
                   stream: data.users.doc(id).snapshots(),
                    builder: (_, snapshot) {
                    return Text(
                      'Rp.${snapshot.data!.get("saldo").toString()}',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Railway',
                        color: Color.fromARGB(255, 186, 165, 246),
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                ),
              ],
            ),

            SizedBox(
              height: 70,
            ),
            Row(
              children: [
                SizedBox(
                  width: 100,
                ),
                InkWell(
                  onTap: () async {
                    dynamic saldo_awal = await data.getFieldById("saldo", data.idlogin);
                    await users.doc(data.idlogin).update({'saldo': saldo_awal-book.myBooking.total_tiket});
                    book.tambahDataBookKeFirestore(id, book.myBooking.judul_film, book.myBooking.tanggal, book.myBooking.tempat, book.myBooking.kursi, book.myBooking.waktu, book.myBooking.id_order, book.myBooking.posterUrl, book.myBooking.harga_tiket, book.myBooking.total_tiket, book.myBooking.fee, book.myBooking.jumlah_tiket);
                    book.bangku = const [];
                    book.myBooking.fee =0;
                    book.myBooking.harga_tiket =0;
                    book.myBooking.id_login ='';
                    book.myBooking.id_order ='';
                    book.myBooking.judul_film ='';
                    book.myBooking.jumlah_tiket =0;
                    book.myBooking.kursi ='';
                    book.myBooking.posterUrl ='';
                    book.myBooking.tanggal ='';
                    book.myBooking.tempat ='';
                    book.myBooking.total_tiket =0;
                    book.myBooking.waktu ='';
                    Navigator.pushNamed(context, '/successcheckout');
                    setState(() {});
                  },
                  child: Text(
                    "Checkout Now",
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
                  onPressed: () async {
                    dynamic saldo_awal = await data.getFieldById("saldo", data.idlogin);
                    await users.doc(data.idlogin).update({'saldo': saldo_awal-book.myBooking.total_tiket});
                    book.tambahDataBookKeFirestore(id, book.myBooking.judul_film, book.myBooking.tanggal, book.myBooking.tempat, book.myBooking.kursi, book.myBooking.waktu, book.myBooking.id_order, book.myBooking.posterUrl, book.myBooking.harga_tiket, book.myBooking.total_tiket, book.myBooking.fee, book.myBooking.jumlah_tiket);
                    book.bangku = [];
                    book.myBooking.fee =0;
                    book.myBooking.harga_tiket =0;
                    book.myBooking.id_login ='';
                    book.myBooking.id_order ='';
                    book.myBooking.judul_film ='';
                    book.myBooking.jumlah_tiket =0;
                    book.myBooking.kursi ='';
                    book.myBooking.posterUrl ='';
                    book.myBooking.tanggal ='';
                    book.myBooking.tempat ='';
                    book.myBooking.total_tiket =0;
                    book.myBooking.waktu ='';
                    Navigator.pushNamed(context, '/successcheckout');
                    
                  
                  },  
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
