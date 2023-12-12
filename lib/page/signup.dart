import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utsmobile/Olah_data.dart';
import 'dart:html' as html;
import 'dart:typed_data';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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

  @override
  void dispose() {
    _username.dispose();
    _conpass.dispose(); // Lakukan tindakan bersih di sini
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
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;

    //  DocumentReference doc = doc.id;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () async {
            await data.signOut();
            if (!context.mounted) return;
            Navigator.pushNamed(context, "/signin");
          },
          child: Image.asset("asset/back.png"),
        ),
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
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
                ),
                const Column(
                  children: [
                    Text(
                      'Create Your',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 18,
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
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 92, 195, 232)),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color.fromARGB(255, 102, 80, 202),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Email Address',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      TextFormField(
                        controller: _email,
                        decoration: const InputDecoration(
                          hintText: 'Type Here',
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 92, 195, 232)),
                          border: OutlineInputBorder(),
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
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 92, 195, 232)),
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
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 92, 195, 232)),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color.fromARGB(255, 102, 80, 202),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () async {
                        if (_pass.text == _conpass.text) {
                          await data.signUp(_email.text, _pass.text);
                          debugPrint("object3");

                          if (data.userAuth != null) {
                            debugPrint("object5");

                            debugPrint(_email.text);
                            debugPrint("objec6");

                            debugPrint(data.userAuth!.email);

                            if (data.userAuth!.email == _email.text) {
                              debugPrint("objec7");
                              if (_image != null) {
                                final ref = FirebaseStorage.instance
                                    .ref()
                                    .child('user/$namaFile');
                                await ref.putData(_image!);
                                String downloadUrl = await FirebaseStorage
                                    .instance
                                    .ref()
                                    .child('user/$namaFile')
                                    .getDownloadURL();
                                debugPrint(downloadUrl);
                                await data.tambahDataKeFirestore(_username.text,
                                    _email.text, _pass.text, downloadUrl);
                              } else {
                                await data.tambahDataKeFirestore(_username.text,
                                    _email.text, _pass.text, "");
                              }

                              data.findDocumentIDByFieldValue();
                              debugPrint("${data.idsignup}ggg");
                              if (!context.mounted) return;
                              Navigator.pushNamed(context, "/userprofile");
                            }
                          } else {
                            //  debugPrint(data.userAuth!.email);
                            debugPrint("tidak ada");
                          }

                          //  debugPrint(SignUpPage().data);
                        }
                      },
                      child: const Row(
                        children: [
                          Text(
                            'Continue To Sign Up',
                            style: TextStyle(
                                color: Color.fromARGB(255, 163, 64, 166)),
                          ),
                          Icon(
                            Icons.arrow_circle_right,
                            size: 35,
                            color: Color.fromARGB(255, 163, 64, 166),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
