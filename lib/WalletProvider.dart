import 'dart:js';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:utsmobile/page/mywallet.dart';

import 'Olah_data.dart';
import 'models/wallets.dart';


FirebaseFirestore db = FirebaseFirestore.instance;
class Wallets extends ChangeNotifier{

    final wallett = db.collection('wallets');
    // final data = Provider.of<olahData>(_, listen: false);

    List<Wallets> _mywallet = [];


  Future<void> tambahDataWalletKeFirestore(String id, String keterangan, int jumlah, String tanggal, String pukul, String id_book) async {
    final CollectionReference wallet = db.collection('wallets');


    try {
      DocumentReference doc = await wallet.add({
        'id_user' : id,
        'jumlah' : jumlah,
        'keterangan': keterangan,
        'tanggal': tanggal,
        'pukul': pukul,
        'id_book': id_book 
      });
      
    

      // Disini Anda bisa melakukan operasi lain yang memanfaatkan nilai docID
    } catch (error) {
      print('Error: $error');
    }
      notifyListeners();

  }

  Future<void> findDocumentIDByFieldValue(String id) async {
     final CollectionReference wallet = db.collection('wallets');
    await wallet
    .where('id_user', isEqualTo: id)
    .get()
    .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        // Loop melalui hasil query untuk mendapatkan ID dari dokumen yang cocok
        querySnapshot.docs.forEach((doc) {
        
        });
      } else {
        print('No documents found with the specified field value');
      }
    })
    .catchError((error) {
      print('Error searching for documents: $error');
    });
    notifyListeners();
}
}