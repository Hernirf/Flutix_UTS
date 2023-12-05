import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Olah_data.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    final data = Provider.of<olahData>(context, listen: false);
    // final tmdbApi = Provider.of<TmdbApi>(context, listen: false);
    final String id = data.idlogin;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20),
        width: lebar,
        // height: 660,
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
          children: [
            StreamBuilder<DocumentSnapshot>(
              stream: data.users.doc(id).snapshots(),
              builder: (_, snapshot) {
                return InkWell(
                  onTap: () {
                    print(snapshot.data!.get("urlPoto"));
                    // print('tes');
                  },
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage(snapshot.data!.get("urlPoto")),
                    radius: 50,
                  ),
                );
              }
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: StreamBuilder<DocumentSnapshot>(
               stream: data.users.doc(id).snapshots(),
                builder: (_, snapshot) {
                  return Text(
                    snapshot.data!.get("fullname"),
                    style: TextStyle(color: Colors.white),
                  );
                }
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: StreamBuilder<DocumentSnapshot>(
                stream: data.users.doc(id).snapshots(),
                builder: (_, snapshot) {
                  return Text(snapshot.data!.get("email"),
                      style: TextStyle(color: Colors.white));
                }
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(left: 50)),
                Image.asset("asset/edit.png"),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  
                  child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/editProfile');
                  },
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.white,fontSize: 20),
                  ),
                ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(left: 50)),
                Image.asset("asset/Wallet.png"),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  
                  child: InkWell(
                     onTap: () {
                    Navigator.pushNamed(context, '/mywallet');
                  },
                    child: Text("My Wallet",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(left: 50)),
                Image.asset("asset/bahasa.png"),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text("Bahasa",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(left: 50)),
                Image.asset("asset/Star.png"),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text("Help Center",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(left: 50)),
                Image.asset("asset/rate.png"),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text("Edit Profile",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
