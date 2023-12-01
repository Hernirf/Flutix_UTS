import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utsmobile/models/movie.dart';
import 'package:utsmobile/models/wallets.dart';

import '../Olah_data.dart';
import '../WalletProvider.dart';
import '../komponen/walletTile.dart';

class mywallet extends StatefulWidget {
  const mywallet({super.key});

  @override
  State<mywallet> createState() => _mywalletState();
}

class _mywalletState extends State<mywallet> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<olahData>(context, listen: false);
    final walletProvider = Provider.of<Wallets>(context, listen: false);
    

    String id = data.idlogin;
    return Scaffold(
      appBar: AppBar(
        
        leading: InkWell(onTap: (){
          Navigator.pushNamed(context, '/bottomnav2');
          
        },child: Image.asset("asset/back.png"),),
        titleSpacing: 50,
        title: Text("My Wallet",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            
        backgroundColor: Color.fromARGB(255, 149, 0, 194),
      ),
      body: ListView(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(),
              child: Container(
                width: 360,
                // height: ,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                      child: Container(
                        width: 300,
                        height: 170,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 102, 80, 202),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color.fromARGB(255, 126, 233, 255),
                                width: 2)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 50, top: 30),
                              child: Image.asset("asset/walleticon.png"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 50),
                              child: StreamBuilder<DocumentSnapshot>(
                                 stream: data.users.doc(id).snapshots(),
                                  builder: (_, snapshot) {
                                  return Text(
                                    'IDR ${snapshot.data!.get("saldo").toString()}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  );
                                }
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 50),
                              child: Text(
                                "Available Balance",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recent Transactions",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          StreamBuilder<QuerySnapshot>(
                            stream: walletProvider.wallett.where('id_user', isEqualTo: data.idlogin).snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                            
                            final List<Wallet> walletList = snapshot.data!.docs.map((DocumentSnapshot document) {
                            print(document.data()); // Tambahkan pernyataan print ini
                            return Wallet(
                              id_user: document['id_user'] as String,
                              tanggal: document['tanggal'] as String,
                              id_book: document['id_book'] as String,
                              jumlah: document['jumlah'] as int,
                              keterangan: document['keterangan'] as String,
                              pukul: document['pukul'] as String,
                              // Atur atribut lainnya sesuai kebutuhan
                            );
                          }).toList();
                          print(walletList.length.toString()); // Tambahkan pernyataan print ini

                            
                              return Container(
                                height: 400,
                    
                          // child: Expanded(
                          child: ListView.builder(
                              
                              itemCount: walletList.length,
                              itemBuilder: (context, index) {
                                SizedBox(height: 10,);
                                return walletsTile(wallet: walletList[index]);
                          }),
                    // ),
                );
                              
                            }
                            }
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                    ElevatedButton(
                    onPressed: ()  {
                      Navigator.pushNamed(context, '/wallettopuup');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF7015A8),
                        padding:
                            EdgeInsets.symmetric(horizontal: 90, vertical: 10),
                        elevation: 10),
                    child: Text(
                      "Top Up Wallet",
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
            ),


          ),
        ],
      ),
    );
  }
}
