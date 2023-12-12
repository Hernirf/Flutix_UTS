import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/bottomnav2');
          },
          child: Image.asset("asset/back.png"),
        ),
        titleSpacing: 50,
        title: const Text(
          "My Wallet",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 149, 0, 194),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(),
            child: Container(
              width: 360,
              // height: ,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                    child: Container(
                      width: 300,
                      height: 170,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 102, 80, 202),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color.fromARGB(255, 126, 233, 255),
                              width: 2)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50, top: 30),
                            child: Image.asset("asset/walleticon.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 50),
                            child: StreamBuilder<DocumentSnapshot>(
                                stream: data.users.doc(id).snapshots(),
                                builder: (_, snapshot) {
                                  return Text(
                                    'IDR ${snapshot.data!.get("saldo").toString()}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  );
                                }),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: Text(
                              "Available Balance",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Recent Transactions",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        StreamBuilder<QuerySnapshot>(
                            stream: walletProvider.wallett
                                .where('id_user', isEqualTo: data.idlogin)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                final List<Wallet> walletList = snapshot
                                    .data!.docs
                                    .map((DocumentSnapshot document) {
                                  debugPrint(document
                                      .data()
                                      .toString()); // Tambahkan pernyataan debugPrint ini
                                  return Wallet(
                                    id_user: document['id_user'] as String,
                                    tanggal: document['tanggal'] as String,
                                    id_book: document['id_book'] as String,
                                    jumlah: document['jumlah'] as int,
                                    keterangan:
                                        document['keterangan'] as String,
                                    pukul: document['pukul'] as String,
                                    // Atur atribut lainnya sesuai kebutuhan
                                  );
                                }).toList();
                                debugPrint(walletList.length
                                    .toString()); // Tambahkan pernyataan debugPrint ini

                                return SizedBox(
                                  height: 400,

                                  // child: Expanded(
                                  child: ListView.builder(
                                      itemCount: walletList.length,
                                      itemBuilder: (context, index) {
                                        const SizedBox(
                                          height: 10,
                                        );
                                        return walletsTile(
                                            wallet: walletList[index]);
                                      }),
                                  // ),
                                );
                              }
                            }),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/wallettopuup');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7015A8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 90, vertical: 10),
                        elevation: 10),
                    child: const Text(
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
        ],
      ),
    );
  }
}
