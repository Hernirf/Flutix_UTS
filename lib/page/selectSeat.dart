import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utsmobile/Olah_data.dart';

import '../Booking_provider.dart';
import '../models/booking.dart';

class selectSeat extends StatefulWidget {
  const selectSeat({super.key});

  @override
  State<selectSeat> createState() => selectSeatState();
}

List<bool> isSelectedList = List.generate(5, (index) => false);
List<bool> seatStatus = List.generate(7, (index) => false);
List<bool> seatStatus2 = List.generate(56, (index) => false);
List<bool> seatStatus3 = List.generate(56, (index) => false);
List<bool> seatStatus4 = List.generate(56, (index) => false);
List<bool> seatStatus5 = List.generate(56, (index) => false);
List<bool> seatStatus6 = List.generate(56, (index) => false);
List<bool> seatStatus7 = List.generate(56, (index) => false);
List<bool> seatStatus8 = List.generate(56, (index) => false);
List<String> bangkuu = [];
var kursi = '';

int index = 0;

class selectSeatState extends State<selectSeat> {
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    final book = Provider.of<Bookingg>(context, listen: false);
    final data = Provider.of<olahData>(context, listen: false);

    // bool? reset;
    // if (reset == true) {
    //   for (int i = 0; i < 7; i++) {
    //     onSeatTap("A", i, kosongin: true);
    //   }
    //   for (int i = 0; i < 7; i++) {
    //     onSeatTap("A", i);
    //   }
    //   reset = false;
    // }

    Booking bookMovie = book.myBooking;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/selectdate');
          },
          child: Image.asset("asset/back.png"),
        ),
        titleSpacing: 50,
        backgroundColor: const Color.fromARGB(255, 149, 0, 194),
      ),
      body: Container(
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: lebar - 60,
                        height: 20,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.purpleAccent,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Center(
                child: Text(
                  'Layar Bioskop',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Railway',
                    color: Colors.purpleAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Railway',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '2',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Railway',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 41,
                      ),
                      Text(
                        '3',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Railway',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '4',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Railway',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '5',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Railway',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        '6',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Railway',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '7',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Railway',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      7,
                      (index) => GestureDetector(
                        onTap: () {
                          onSeatTap("A", index);
                        },
                        child: SeatWidget(
                            index: index, isReserved: seatStatus[index]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      7,
                      (index) => GestureDetector(
                        onTap: () {
                          onSeatTap("B", index);
                        },
                        child: SeatWidget(
                            index: index, isReserved: seatStatus2[index]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      7,
                      (index) => GestureDetector(
                        onTap: () {
                          onSeatTap("C", index);
                        },
                        child: SeatWidget(
                            index: index, isReserved: seatStatus3[index]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      7,
                      (index) => GestureDetector(
                        onTap: () {
                          onSeatTap("D", index);
                        },
                        child: SeatWidget(
                            index: index, isReserved: seatStatus4[index]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      7,
                      (index) => GestureDetector(
                        onTap: () {
                          onSeatTap("E", index);
                        },
                        child: SeatWidget(
                            index: index, isReserved: seatStatus5[index]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      7,
                      (index) => GestureDetector(
                        onTap: () {
                          onSeatTap("F", index);
                        },
                        child: SeatWidget(
                            index: index, isReserved: seatStatus6[index]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      7,
                      (index) => GestureDetector(
                        onTap: () {
                          onSeatTap("G", index);
                        },
                        child: SeatWidget(
                            index: index, isReserved: seatStatus7[index]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      7,
                      (index) => GestureDetector(
                        onTap: () {
                          onSeatTap("H", index);
                        },
                        child: SeatWidget(
                            index: index, isReserved: seatStatus8[index]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: Colors.blueAccent,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            'Booked',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Railway',
                              color: Color.fromARGB(255, 157, 35, 213),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: const Color.fromARGB(255, 183, 187, 195),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            'Available',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Railway',
                              color: Color.fromARGB(255, 157, 35, 213),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.deepPurple),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            'Selected',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Railway',
                              color: Color.fromARGB(255, 157, 35, 213),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 35,
                          ),
                          InkWell(
                            onTap: () async {
                              book.bangku = bangkuu;

                              for (var kursii in bangkuu) {
                                kursi = '$kursi$kursii, ';
                              }
                              bookMovie.kursi = kursi;
                              dynamic saldo_awal = await data.getFieldById(
                                  "saldo", data.idlogin);
                              // debugPrint(saldo_awal.toString());

                              bookMovie.fee = 4000 * book.bangku.length;
                              bookMovie.harga_tiket =
                                  50000 * book.bangku.length;
                              bookMovie.total_tiket =
                                  bookMovie.fee + bookMovie.harga_tiket;
                              if (int.parse(saldo_awal) >=
                                  bookMovie.total_tiket) {
                                if (!context.mounted) return;
                                Navigator.pushNamed(context, '/checkout');
                              } else {
                                if (!context.mounted) return;
                                Navigator.pushNamed(context, '/checkoutf');
                              }
                            },
                            child: const Text(
                              "Confirm Your Book",
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
                              book.bangku = bangkuu;
                              dynamic saldo_awal = await data.getFieldById(
                                  "saldo", data.idlogin);
                              // debugPrint(saldo_awal.toString());
                              for (var kursii in bangkuu) {
                                kursi = '$kursi$kursii, ';
                              }
                              bookMovie.kursi = kursi;
                              bookMovie.fee = 4000 * book.bangku.length;
                              bookMovie.harga_tiket =
                                  30000 * book.bangku.length;
                              bookMovie.total_tiket =
                                  bookMovie.fee + bookMovie.harga_tiket;
                              bookMovie.jumlah_tiket = book.bangku.length;
                              debugPrint(saldo_awal.toString());
                              if (saldo_awal >= bookMovie.total_tiket) {
                                setState(() {
                                  // bangkuu = [];
                                  kursi = '';
                                });
                                if (!context.mounted) return;
                                Navigator.pushNamed(context, '/checkout');
                              } else {
                                setState(() {
                                  bangkuu = [];
                                });
                                if (!context.mounted) return;
                                Navigator.pushNamed(context, '/checkoutf');
                              }

                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSeatTap(String alphabet, int index, {bool? kosongin}) {
    if (alphabet == "A") {
      if (kosongin == true) {
        setState(() {
          seatStatus[index] = true;
          if (seatStatus[index] == false) {
            bangkuu.remove(alphabet + (index + 1).toString());
          } else {
            bangkuu.add(alphabet + (index + 1).toString());
          }
        });
      } else {
        setState(() {
          seatStatus[index] = !seatStatus[index];
          if (seatStatus[index] == false) {
            bangkuu.remove(alphabet + (index + 1).toString());
          } else {
            bangkuu.add(alphabet + (index + 1).toString());
          }
        });
      }
    } else if (alphabet == "B") {
      setState(() {
        seatStatus2[index] = !seatStatus2[index];
        if (seatStatus2[index] == false) {
          bangkuu.remove(alphabet + (index + 1).toString());
        } else {
          bangkuu.add(alphabet + (index + 1).toString());
        }
      });
    } else if (alphabet == "C") {
      setState(() {
        seatStatus3[index] = !seatStatus3[index];
        if (seatStatus3[index] == false) {
          bangkuu.remove(alphabet + (index + 1).toString());
        } else {
          bangkuu.add(alphabet + (index + 1).toString());
        }
      });
    } else if (alphabet == "D") {
      setState(() {
        seatStatus4[index] = !seatStatus4[index];
        if (seatStatus4[index] == false) {
          bangkuu.remove(alphabet + (index + 1).toString());
        } else {
          bangkuu.add(alphabet + (index + 1).toString());
        }
      });
    } else if (alphabet == "E") {
      setState(() {
        seatStatus5[index] = !seatStatus5[index];
        if (seatStatus5[index] == false) {
          bangkuu.remove(alphabet + (index + 1).toString());
        } else {
          bangkuu.add(alphabet + (index + 1).toString());
        }
      });
    } else if (alphabet == "F") {
      setState(() {
        seatStatus6[index] = !seatStatus6[index];
        if (seatStatus6[index] == false) {
          bangkuu.remove(alphabet + (index + 1).toString());
        } else {
          bangkuu.add(alphabet + (index + 1).toString());
        }
      });
    } else if (alphabet == "G") {
      setState(() {
        seatStatus7[index] = !seatStatus7[index];
        if (seatStatus7[index] == false) {
          bangkuu.remove(alphabet + (index + 1).toString());
        } else {
          bangkuu.add(alphabet + (index + 1).toString());
        }
      });
    } else if (alphabet == "H") {
      setState(() {
        seatStatus8[index] = !seatStatus8[index];
        if (seatStatus8[index] == false) {
          bangkuu.remove(alphabet + (index + 1).toString());
        } else {
          bangkuu.add(alphabet + (index + 1).toString());
        }
      });
    }
  }
}

class SeatWidget extends StatelessWidget {
  final int index;
  final bool isReserved;

  const SeatWidget({super.key, required this.index, required this.isReserved});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: isReserved ? Colors.deepPurple : Colors.white,
      ),
    );
  }
}
