import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:utsmobile/models/booking.dart';


FirebaseFirestore db = FirebaseFirestore.instance;
class Bookingg extends ChangeNotifier{
  Booking _myBooking = Booking(); // Objek yang akan disimpan

  Booking get myBooking => _myBooking;
  List<String> bangku = [];
  final bookCollection = db.collection('MyBookMovie');



  String generateRandomId(int length) {
      const chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
      Random random = Random.secure();
      
      List<int> charCodes = List<int>.generate(length, (index) {
        return chars.codeUnitAt(random.nextInt(chars.length));
      });

      return String.fromCharCodes(charCodes);
  }

  Future<void> tambahDataBookKeFirestore(String id, String judul_film, String tanggal, String tempat, String kursi, String waktu, String id_order, String posterUrl, int hargaTiket, int total, int fee, int jumlah_tiket)async {
    final CollectionReference bookMovie = db.collection('MyBookMovie');


    try {
      DocumentReference doc = await bookMovie.add({
        'id_user' : id,
        'judul_film' : judul_film,
        'tanggal': tanggal,
        'tempat': tempat,
        'kursi': kursi,
        'waktu': waktu,
        'id_order': id_order,
        'poster': posterUrl,
        'hargaTiket': hargaTiket,
        'total': total,
        'fee': fee,
        'jumlah_tiket': jumlah_tiket,

      });

      // Disini Anda bisa melakukan operasi lain yang memanfaatkan nilai docID
    } catch (error) {
      print('Error: $error');
    }
      notifyListeners();

  }

  Booking _myMovieDetail = Booking(); // Objek yang akan disimpan

  Booking get myMovieDetail => _myMovieDetail;

  void setMovieindex(Booking newValue){
   _myMovieDetail = newValue;
    notifyListeners();
}

}