import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utsmobile/WalletProvider.dart';

import '../Olah_data.dart';

class WalletTopUp extends StatefulWidget {
  const WalletTopUp({super.key});

  @override
  State<WalletTopUp> createState() => _WalletTopUpState();
}

class _WalletTopUpState extends State<WalletTopUp> {
  final TextEditingController _saldo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<olahData>(context, listen: false);
    final walletProvider = Provider.of<Wallets>(context, listen: false);

    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference users = db.collection("users");
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/mywallet');
          },
          child: Image.asset("asset/back.png"),
        ),
        titleSpacing: 90,
        title: const Text(
          "Top Up",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 149, 0, 194),
      ),
      body: ListView(
        children: [
          Container(
            width: 360,
            height: 750,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(),
                    child: Text(
                      "Amount",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: TextField(
                      controller: _saldo,
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF4C3492),
                          labelText: "IDR",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color.fromARGB(255, 208, 165, 203),
                            width: 3,
                          )),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          labelStyle: TextStyle(
                            color: Color(0xFF5CC3E8),
                          )),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 10),
                    child: Text(
                      "Choose by template",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              _saldo.text = "50000";
                            },
                            child: Container(
                              width: 120,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF463E99),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: const Color(0xFF7EE9FF),
                                      width: 2)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "IDR",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "50.000",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _saldo.text = "100000";
                              });
                            },
                            child: Container(
                              width: 120,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF463E99),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: const Color(0xFF7EE9FF),
                                      width: 2)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "IDR",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "100.000",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              _saldo.text = "300000";
                            },
                            child: Container(
                              width: 120,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF463E99),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: const Color(0xFF7EE9FF),
                                      width: 2)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "IDR",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "300.000",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              _saldo.text = "1000000";
                            },
                            child: Container(
                              width: 120,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF463E99),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: const Color(0xFF7EE9FF),
                                      width: 2)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "IDR",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "1000.000",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              _saldo.text = "2000000";
                            },
                            child: Container(
                              width: 120,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF463E99),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: const Color(0xFF7EE9FF),
                                      width: 2)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "IDR",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        shadows: [
                                          Shadow(
                                            color: Colors.grey,
                                            offset: Offset(1, 1),
                                            blurRadius: 10,
                                          ),
                                        ]),
                                  ),
                                  Text(
                                    "2000.000",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              _saldo.text = "75000";
                            },
                            child: Container(
                              width: 120,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF463E99),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: const Color(0xFF7EE9FF),
                                      width: 2)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "IDR",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "75.000",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              _saldo.text = "200000";
                            },
                            child: Container(
                              width: 120,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF463E99),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: const Color(0xFF7EE9FF),
                                      width: 2)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "IDR",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "200.000",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              _saldo.text = "500000";
                            },
                            child: Container(
                              width: 120,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF463E99),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: const Color(0xFF7EE9FF),
                                      width: 2)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "IDR",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "500.000",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              _saldo.text = "1500000";
                            },
                            child: Container(
                              width: 120,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF463E99),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: const Color(0xFF7EE9FF),
                                      width: 2)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "IDR",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "1500.000",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              _saldo.text = "2500000";
                            },
                            child: Container(
                              width: 120,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF463E99),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: const Color(0xFF7EE9FF),
                                      width: 2)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "IDR",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "2500.000",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                  ElevatedButton(
                    onPressed: () async {
                      dynamic saldoAwal =
                          await data.getFieldById("saldo", data.idlogin);
                      debugPrint(saldoAwal.toString());
                      await users.doc(data.idlogin).update(
                          {'saldo': int.parse(_saldo.text) + saldoAwal});
                      await walletProvider.tambahDataWalletKeFirestore(
                          data.idlogin,
                          "Top Up",
                          int.parse(_saldo.text),
                          '22 November 2023',
                          '10.00',
                          '');
                      if (!context.mounted) return;
                      Navigator.pushNamed(context, "/successtopup");
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7015A8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 90, vertical: 20),
                        elevation: 10),
                    child: const Text(
                      "Top Up Now",
                      style: TextStyle(
                        fontSize: 15,
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
