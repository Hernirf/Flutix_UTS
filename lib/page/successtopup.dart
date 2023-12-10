import 'package:flutter/material.dart';

class successtopup extends StatefulWidget {
  const successtopup({super.key});

  @override
  State<successtopup> createState() => _successtopupState();
}

class _successtopupState extends State<successtopup> {
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: lebar,
        height: 660,
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
              padding: const EdgeInsets.only(top: 100, bottom: 50),
              child: Image.asset("asset/success.png"),
            ),
            const Text(
              "Wallet is Ready!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("You have successfully",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal)),
            const Text("feed your wallet",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal)),
            const Padding(padding: EdgeInsets.only(top: 100)),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/mywallet');
              },
              child: const Text(
                "MyWallet",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6650CA),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 15)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/bottomnav');
                },
                child: const Text("Back to Home",
                    style: TextStyle(color: Color(0xFFAEAEAE)))),
          ],
        ),
      ),
    );
  }
}
