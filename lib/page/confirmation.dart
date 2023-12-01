// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Olah_data.dart';



class ConfirmationPage extends StatelessWidget {
  // final String fullName;

  // ConfirmationPage();

  @override
  Widget build(BuildContext context) {
  final data = Provider.of<olahData>(context, listen: false);
  var id = data.idsignup;
  // data.filedFromDatabase(id,'fullname');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 149, 0, 194),
        automaticallyImplyLeading: false,

      ),
      body:Container(
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
                Text(
                  'Create Your Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50),
                StreamBuilder<DocumentSnapshot>(
                    stream: data.users.doc(id).snapshots(),
                    builder: (_, snapshot) {
                      return InkWell(
                        onTap: () {
                          print(snapshot.data!.get("urlPoto"));
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(snapshot.data!.get("urlPoto")),
                          radius: 60,
                        ),
                      );
                    }
                  ),
                SizedBox(height: 50), // Menurunkan tombol ke bawah
                Text(
                  'Welcome,',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                StreamBuilder<DocumentSnapshot>(
                  stream: data.users.doc(id).snapshots(),
                  builder: (_, snapshot) {
                    return Text(
                     snapshot.data!.get("fullname"),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    );
                  }
                ),
                SizedBox(height: 100), // Menurunkan tombol ke bawah
                TextButton(
                  onPressed: () async {
                    await data.findDocumentIDByFieldValue();
                    //  Navigator.pushNamed(context, "/homemovies");
                    Navigator.pushNamed(context, '/bottomnav');

                    // Lakukan tindakan yang sesuai saat tombol ditekan
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 140,),
                      Text(
                        'Yes, I\'m In',
                        style:
                            TextStyle(color: Color.fromARGB(255, 163, 64, 166)),
                      ),
                       SizedBox(width: 55,),
      
                       Icon(Icons.arrow_circle_right,
                          size: 60, color: Color.fromARGB(255, 248, 128, 252)),
                     
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        
    );
  }
}
