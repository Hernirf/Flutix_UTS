import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Booking_provider.dart';
import '../Olah_data.dart';
import '../komponen/tiket.dart';
import '../models/booking.dart';

class myticket extends StatefulWidget {
  const myticket({super.key});

  @override
  State<myticket> createState() => _myticketState();
}

class _myticketState extends State<myticket> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<olahData>(context, listen: false);
    final BookProvider = Provider.of<Bookingg>(context, listen: false);
    double tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            height: tinggi,
            decoration: const BoxDecoration(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Text(
                    "My Tickets",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 158,
                      height: 47,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 126, 233, 255),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        "NOW",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.black),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 158,
                      height: 47,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(155, 126, 233, 255),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "USED",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[900]),
                      ),
                    ),
                  ],
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: BookProvider.bookCollection
                        .where('id_user', isEqualTo: data.idlogin)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final List<Booking> bookList = snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          // print(document.data()); // Tambahkan pernyataan print ini
                          return Booking(
                            id_login: document['id_user'] as String,
                            judul_film: document['judul_film'] as String,
                            tanggal: document['tanggal'] as String,
                            tempat: document['tempat'] as String,
                            kursi: document['kursi'] as String,
                            id_order: document['id_order'] as String,
                            waktu: document['waktu'] as String,
                            posterUrl: document['poster'] as String,
                            harga_tiket: document['hargaTiket'] as int,
                            total_tiket: document['total'] as int,
                            fee: document['fee'] as int,
                            jumlah_tiket: document['jumlah_tiket'] as int,

                            // Atur atribut lainnya sesuai kebutuhan
                          );
                        }).toList();
                        // print(bookList.length.toString()); // Tambahkan pernyataan print ini
                        return Expanded(
                          child: ListView.builder(
                              itemCount: bookList.length,
                              itemBuilder: (context, index) {
                                return tiketTile(book: bookList[index]);
                              }),
                        );
                      }
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
