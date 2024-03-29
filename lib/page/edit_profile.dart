import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utsmobile/Olah_data.dart';
import 'dart:html' as html;
import 'dart:typed_data';

class edit_profile extends StatefulWidget {
  const edit_profile({super.key});

  @override
  _edit_profileState createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _conpass = TextEditingController();
  Uint8List? _image;
  String namaFile = '';

  @override
  void initState() {
    super.initState();
    // Lakukan inisialisasi atau langganan sumber daya di sini
  }

  Future<List<String>> fetchData() async {
    final data = Provider.of<olahData>(context, listen: false);
    debugPrint(data.idlogin);
    debugPrint(await data.getFieldById("fullname", data.idlogin));
    // Contoh penundaan untuk mensimulasikan operasi async
    List<String> edit = [];
    edit.add(await data.getFieldById("fullname", data.idlogin));
    edit.add(await data.getFieldById("pass", data.idlogin));
    return edit;
  }

  @override
  void dispose() {
    // Lakukan tindakan bersih di sini
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  Future<void> _uploadImage() async {
    // final html.InputElement input = html.FileUploadInputElement()..accept = 'image/*';
    final html.FileUploadInputElement input = html.FileUploadInputElement();
    input.accept = 'user/*';
    input.click();

    input.onChange.listen((event) {
      final files = input.files;
      if (files != null && files.isNotEmpty) {
        final file = files[0];
        final reader = html.FileReader();
        reader.readAsArrayBuffer(file);
        reader.onLoadEnd.listen((loadEndEvent) async {
          final Uint8List data = reader.result as Uint8List;
          _image = data;
          namaFile = file.name;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<olahData>(context, listen: false);
    fetchData().then((result) {
      _username.text = result.first;
      _pass.text = result.last;
    });
    data.setDataIndex(2);
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference users = db.collection("users");

    //  DocumentReference doc = doc.id;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () async {
            await data.signOut();
            if (!context.mounted) return;
            Navigator.pushNamed(context, "/bottomnav");
          },
          child: Image.asset("asset/back.png"),
        ),
        backgroundColor: const Color.fromARGB(255, 149, 0, 194),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  _uploadImage();
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Color.fromARGB(255, 102, 80, 202),
                    // Icon karakter orang default
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Color.fromARGB(255, 153, 153, 153),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Column(
                children: [
                  Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Full Name',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    TextFormField(
                      controller: _username,
                      decoration: const InputDecoration(
                        hintText: 'Type Here',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 92, 195, 232)),
                        border: OutlineInputBorder(
                            //     borderSide: BorderSide(
                            //   color: Color.fromARGB(255, 208, 165, 203),
                            // )
                            ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 102, 80, 202),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Password',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    TextFormField(
                      controller: _pass,
                      decoration: const InputDecoration(
                        hintText: 'Type Here',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 92, 195, 232)),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Color.fromARGB(255, 102, 80, 202),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Confirm Password',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    TextFormField(
                      controller: _conpass,
                      decoration: const InputDecoration(
                        hintText: 'Type Here',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 92, 195, 232)),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Color.fromARGB(255, 102, 80, 202),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () async {
                  if (_pass.text == _conpass.text) {
                    debugPrint("object");
                    if (data.userAuth != null) {
                      debugPrint("object2");

                      if (_image != null) {
                        final ref = FirebaseStorage.instance
                            .ref()
                            .child('user/$namaFile');
                        await ref.putData(_image!);
                        String downloadUrl = await FirebaseStorage.instance
                            .ref()
                            .child('user/$namaFile')
                            .getDownloadURL();
                        debugPrint(downloadUrl);
                        await users.doc(data.idlogin).update({
                          'fullname': _username.text,
                          'pass': _pass.text,
                          'urlPoto': downloadUrl
                        });
                      } else {
                        debugPrint("object3");

                        await users.doc(data.idlogin).update(
                            {'fullname': _username.text, 'pass': _pass.text});
                        debugPrint("object4");
                      }
                      if (!context.mounted) return;
                      Navigator.pushNamed(context, '/bottomnav2');

                      // Navigator.push(context,
                      // MaterialPageRoute(builder: (context) => const bottomnav(2)));
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7015A8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 90, vertical: 10),
                    elevation: 10),
                child: const Text(
                  "Update Now",
                  style: TextStyle(
                    fontSize: 18,
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
    );
  }
}
