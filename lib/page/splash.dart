import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Olah_data.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<olahData>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 149, 0, 194),
        automaticallyImplyLeading: false,
      ),
      body: Container(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: Image.asset(
                  "asset/logo.png",
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                'New Experience',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Watching with new movie much easier than before',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 70),
              ElevatedButton(
                onPressed: () {
                  data.signOut();
                  Navigator.pushNamed(context, "/signup");

                  // Navigasi ke halaman selanjutnya
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(
                        255, 102, 80, 202), // Ubah warna ElevatedButton
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  data.signOut();
                  Navigator.pushNamed(context, "/signin");

                  // Navigasi ke halaman login.
                },
                child: const Text(
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
