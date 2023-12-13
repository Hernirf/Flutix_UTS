// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SuccessCheckoutPage extends StatefulWidget {
  const SuccessCheckoutPage({Key? key}) : super(key: key);

  @override
  State<SuccessCheckoutPage> createState() => _SuccessCheckoutPageState();
}

class _SuccessCheckoutPageState extends State<SuccessCheckoutPage> {
  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    double tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent, // Atur latar belakang transparan
      body: SingleChildScrollView(
        child: Container(
          width: lebar,
          height: tinggi,
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
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'asset/logo1_checkoutsuccess.png',
                    height: 170,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  'You Have Successfully',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Railway',
                    color: Colors.white,
                  ),
                ),
                Text(
                  'brought the ticket !',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Railway',
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, '/myticket');
                      Navigator.pushNamed(context, '/bottomnav');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF7015A8),
                        padding:
                            EdgeInsets.symmetric(horizontal: 90, vertical: 10),
                        elevation: 10),
                    child: Text(
                      "My Ticket",
                      style: TextStyle(
                        fontSize: 24,
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
                    )),
                SizedBox(
                  height: 80,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/bottomnav');
                  },
                  child: Text(
                    "Back to Home",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Railway',
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
