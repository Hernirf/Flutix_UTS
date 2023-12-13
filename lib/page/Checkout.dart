import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utsmobile/Booking_provider.dart';
import 'package:utsmobile/Olah_data.dart';
import 'package:utsmobile/page/selectPlaceDate.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    double tinggi = MediaQuery.of(context).size.height;
    final book = Provider.of<Bookingg>(context, listen: false);
    final data = Provider.of<olahData>(context, listen: false);
    String id = data.idlogin;
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
        backgroundColor: const Color.fromARGB(255, 149, 0, 194),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: lebar,
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Row(
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
              const Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "before CheckOut",
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
              const SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 30),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Image.network(book.myBooking.posterUrl,
                          fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.myBooking.judul_film,
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Railway',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
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
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 320,
                  height: 5,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.purpleAccent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),

              //isi
              const SizedBox(
                height: 12,
              ),

              Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      const Text(
                        "ID Order",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Railway',
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Text(
                        book.myBooking.id_order,
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Railway',
                          color: Color.fromARGB(255, 186, 165, 246),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      const Text(
                        "Cinema",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Railway',
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Text(
                        book.myBooking.tempat,
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Railway',
                          color: Color.fromARGB(255, 186, 165, 246),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      const Text(
                        "Date & Time",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Railway',
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Text(
                        '${book.myBooking.tanggal}, ${book.myBooking.waktu}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Railway',
                          color: Color.fromARGB(255, 186, 165, 246),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      const Text(
                        "Seat",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Railway',
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 70,
                      ),
                      Text(
                        book.myBooking.kursi,
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Railway',
                          color: Color.fromARGB(255, 186, 165, 246),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      const Text(
                        "Ticket",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Railway',
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Text(
                        "Rp.30.000 x ${book.bangku.length}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Railway',
                          color: Color.fromARGB(255, 186, 165, 246),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      const Text(
                        "Fees",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Railway',
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 65,
                      ),
                      Text(
                        "Rp.4.000 x ${book.bangku.length}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Railway',
                          color: Color.fromARGB(255, 186, 165, 246),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      const Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Railway',
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 65,
                      ),
                      Text(
                        "Rp.${30000 * book.bangku.length + 4000 * book.bangku.length}",
                        style: const TextStyle(
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
              const SizedBox(
                height: 20,
              ),

              Center(
                child: Container(
                  width: 320,
                  height: 5,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.purpleAccent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    "Saldo Wallet",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Railway',
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  StreamBuilder<DocumentSnapshot>(
                      stream: data.users.doc(id).snapshots(),
                      builder: (_, snapshot) {
                        return Text(
                          'Rp.${snapshot.data!.get("saldo").toString()}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'Railway',
                            color: Color.fromARGB(255, 186, 165, 246),
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
                ],
              ),

              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 100,
                  ),
                  InkWell(
                    onTap: () async {
                      dynamic saldoAwal =
                          await data.getFieldById("saldo", data.idlogin);
                      await users.doc(data.idlogin).update(
                          {'saldo': saldoAwal - book.myBooking.total_tiket});
                      book.tambahDataBookKeFirestore(
                          id,
                          book.myBooking.judul_film,
                          book.myBooking.tanggal,
                          book.myBooking.tempat,
                          book.myBooking.kursi,
                          book.myBooking.waktu,
                          book.myBooking.id_order,
                          book.myBooking.posterUrl,
                          book.myBooking.harga_tiket,
                          book.myBooking.total_tiket,
                          book.myBooking.fee,
                          book.myBooking.jumlah_tiket);
                      setState(() {
                        book.bangku = const [];
                        // print( book.bangku + "ddd");
                        book.myBooking.fee = 0;
                        book.myBooking.harga_tiket = 0;
                        book.myBooking.id_login = '';
                        book.myBooking.id_order = '';
                        book.myBooking.judul_film = '';
                        book.myBooking.jumlah_tiket = 0;
                        book.myBooking.kursi = '';
                        book.myBooking.posterUrl = '';
                        book.myBooking.tanggal = '';
                        book.myBooking.tempat = '';
                        book.myBooking.total_tiket = 0;
                        book.myBooking.waktu = '';
                      });
                      if (!context.mounted) return;
                      Navigator.pushNamed(context, '/successCheckOut');
                    },
                    child: const Text(
                      "CheckOut Now",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Railway',
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_circle_right_rounded),
                    color: Colors.blue,
                    iconSize: 40,
                    onPressed: () async {
                      dynamic saldoAwal =
                          await data.getFieldById("saldo", data.idlogin);
                      await users.doc(data.idlogin).update(
                          {'saldo': saldoAwal - book.myBooking.total_tiket});
                      book.tambahDataBookKeFirestore(
                          id,
                          book.myBooking.judul_film,
                          book.myBooking.tanggal,
                          book.myBooking.tempat,
                          book.myBooking.kursi,
                          book.myBooking.waktu,
                          book.myBooking.id_order,
                          book.myBooking.posterUrl,
                          book.myBooking.harga_tiket,
                          book.myBooking.total_tiket,
                          book.myBooking.fee,
                          book.myBooking.jumlah_tiket);
                      book.bangku = [];
                      book.myBooking.fee = 0;
                      book.myBooking.harga_tiket = 0;
                      book.myBooking.id_login = '';
                      book.myBooking.id_order = '';
                      book.myBooking.judul_film = '';
                      book.myBooking.jumlah_tiket = 0;
                      book.myBooking.kursi = '';
                      book.myBooking.posterUrl = '';
                      book.myBooking.tanggal = '';
                      book.myBooking.tempat = '';
                      book.myBooking.total_tiket = 0;

                      for (int i = 0; i < 3; i++) {
                        chooseBM[i] = false;
                        chooseCGV[i] = false;
                        chooseCS[i] = false;
                      }
                      for (int i = 0; i < 4; i++) {
                        chooseHari[i] = false;
                      }
                      if (!context.mounted) return;
                      Navigator.pushNamed(context, '/successcheckout');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
