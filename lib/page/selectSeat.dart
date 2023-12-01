// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utsmobile/Olah_data.dart';

import '../Booking_provider.dart';
import '../models/booking.dart';

class selectSeat extends StatefulWidget {
  const selectSeat({super.key});

  @override
  State<selectSeat> createState() => _selectSeatState();
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

class _selectSeatState extends State<selectSeat> {
  @override
  Widget build(BuildContext context) {
final book = Provider.of<Bookingg>(context, listen: false);
final data = Provider.of<olahData>(context, listen: false);

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 300,
                        height: 20,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.purpleAccent,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Center(
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
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 37,
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
                          _onSeatTap("A",index);
                        },
                        child: SeatWidget(
                            index: index, isReserved: seatStatus[index]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      7,
                      (index) => GestureDetector(
                        onTap: () {
                          _onSeatTap("B",index);
                        },
                        child:
                            SeatWidget(index: index, isReserved: seatStatus2[index]),
                      ),
                    ),
                  ),SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      7,
                      (index) => GestureDetector(
                        onTap: () {
                          _onSeatTap("C",index);
                          
                        },
                        child:
                            SeatWidget(index: index, isReserved: seatStatus3[index]),
                      ),
                    ),
                  ),SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      7,
                      (index) => GestureDetector(
                        onTap: () {
                          _onSeatTap("D",index);
                         
                        },
                        child:
                            SeatWidget(index: index, isReserved: seatStatus4[index]),
                      ),
                    ),
                  ),SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      7,
                      (index) => GestureDetector(
                        onTap: () {
                          _onSeatTap("E",index);
                         
                        },
                        child:
                            SeatWidget(index: index, isReserved: seatStatus5[index]),
                      ),
                    ),
                  ),SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      7,
                      (index) => GestureDetector(
                        onTap: () {
                          _onSeatTap("F",index);
                        },
                        child:
                            SeatWidget(index: index, isReserved: seatStatus6[index]),
                      ),
                    ),
                  ),SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      7,
                      (index) => GestureDetector(
                        onTap: () {
                          _onSeatTap("G",index);
                        },
                        child:
                            SeatWidget(index: index, isReserved: seatStatus7[index]),
                      ),
                    ),
                  ),SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      7,
                      (index) => GestureDetector(
                        onTap: () {
                          _onSeatTap("H",index);
                        },
                        child:
                            SeatWidget(index: index, isReserved: seatStatus8[index]),
                      ),
                    ),
                  ),

                  
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
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
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Booked',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Railway',
                              color: Color.fromARGB(255, 157, 35, 213),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: Color.fromARGB(255, 183, 187, 195),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Available',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Railway',
                              color: Color.fromARGB(255, 157, 35, 213),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.deepPurple),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Selected',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Railway',
                              color: Color.fromARGB(255, 157, 35, 213),
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
                            onTap: () async {
                               book.bangku = bangkuu;
                               
                                for(var kursii in bangkuu){
                                kursi = kursi + '$kursii, ';
                            }
                            bookMovie.kursi = kursi;
                              dynamic saldo_awal = await data.getFieldById("saldo", data.idlogin);
                              // print(saldo_awal.toString());
                              
                              bookMovie.fee = 4000*book.bangku.length;
                              bookMovie.harga_tiket = 50000*book.bangku.length;
                              bookMovie.total_tiket = bookMovie.fee+bookMovie.harga_tiket;
                              if(int.parse(saldo_awal)>=bookMovie.total_tiket){
                                Navigator.pushNamed(context, '/checkout');
                              }
                              else{
                                Navigator.pushNamed(context, '/checkoutf');
                              }
                            
                            },
                            child: Text(
                              "Confirm Your Book",
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
                            book.bangku = bangkuu;
                            dynamic saldo_awal = await data.getFieldById("saldo", data.idlogin);
                            // print(saldo_awal.toString());
                            for(var kursii in bangkuu){
                                kursi = kursi + '$kursii, ';
                            }
                            bookMovie.kursi = kursi;
                            bookMovie.fee = 4000*book.bangku.length;
                            bookMovie.harga_tiket = 30000*book.bangku.length;
                            bookMovie.total_tiket = bookMovie.fee+bookMovie.harga_tiket;
                            bookMovie.jumlah_tiket = book.bangku.length;
                            print(saldo_awal.toString());
                            if(saldo_awal>=bookMovie.total_tiket){
                              Navigator.pushNamed(context, '/checkout');
                            }
                            else{
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

  void _onSeatTap(String alphabet, int index) {


    if (alphabet == "A") {
      setState(() {
        seatStatus[index] = !seatStatus[index];
        if(seatStatus[index] == false){
          bangkuu.remove('${alphabet+(index+1).toString()}');
        }
        else{
          bangkuu.add('${alphabet+(index+1).toString()}');
        }
      });
    }
    else if (alphabet == "B") {
      setState(() {
        seatStatus2[index] = !seatStatus2[index];
        if(seatStatus2[index] == false){
          bangkuu.remove('${alphabet+(index+1).toString()}');
        }
        else{
          bangkuu.add('${alphabet+(index+1).toString()}');
        }
      });
    }
    else if (alphabet == "C") {
      setState(() {
        seatStatus3[index] = !seatStatus3[index];
        if(seatStatus3[index] == false){
          bangkuu.remove('${alphabet+(index+1).toString()}');
        }
        else{
          bangkuu.add('${alphabet+(index+1).toString()}');
        }
      });
    }
    else if (alphabet == "D") {
      setState(() {
        seatStatus4[index] = !seatStatus4[index];
        if(seatStatus4[index] == false){
          bangkuu.remove('${alphabet+(index+1).toString()}');
        }
        else{
          bangkuu.add('${alphabet+(index+1).toString()}');
        }
      });
    }
    else if (alphabet == "E") {
      setState(() {
        seatStatus5[index] = !seatStatus5[index];
        if(seatStatus5[index] == false){
          bangkuu.remove('${alphabet+(index+1).toString()}');
        }
        else{
          bangkuu.add('${alphabet+(index+1).toString()}');
        }
      });
    }
    else if (alphabet == "F") {
      setState(() {
        seatStatus6[index] = !seatStatus6[index];
        if(seatStatus6[index] == false){
          bangkuu.remove('${alphabet+(index+1).toString()}');
        }
        else{
          bangkuu.add('${alphabet+(index+1).toString()}');
        }
      });
    }
    else if (alphabet == "G") {
      setState(() {
        seatStatus7[index] = !seatStatus7[index];
        if(seatStatus7[index] == false){
          bangkuu.remove('${alphabet+(index+1).toString()}');
        }
        else{
          bangkuu.add('${alphabet+(index+1).toString()}');
        }
        
      });
    }
    else if (alphabet == "H") {
      setState(() {
        seatStatus8[index] = !seatStatus8[index];
        if(seatStatus8[index] == false){
          bangkuu.remove('${alphabet+(index+1).toString()}');
        }
        else{
          bangkuu.add('${alphabet+(index+1).toString()}');
        }
      });
    }
  }
}



class SeatWidget extends StatelessWidget {
  final int index;
  final bool isReserved;

  SeatWidget({required this.index, required this.isReserved});

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

