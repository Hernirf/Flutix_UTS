import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Olah_data.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<olahData>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 149, 0, 194),
        automaticallyImplyLeading: false,
      ),
      body: Container(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                child: Image.asset(
                  "asset/logo.png",
                ),
              ),
              SizedBox(height: 50),
              Text(
                'New Experience',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Watching with new movie much easier than before',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 70),
              ElevatedButton(
                onPressed: () {
                  data.signOut();
                  Navigator.pushNamed(context, "/signup");

                  // Navigasi ke halaman selanjutnya
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(
                        255, 102, 80, 202), // Ubah warna ElevatedButton
                  ),
                ),
                child: Text('Get Started',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  data.signOut();
                  Navigator.pushNamed(context, "/signin");

                  // Navigasi ke halaman login.
                },
                child: Text(
                  'Sign In To My Account',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
