import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utsmobile/page/signup.dart';

import '../Olah_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserProfilePage(),
    );
  }
}

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  // Buat variabel untuk menyimpan status pilihan bahasa
  bool isIndonesianSelected = false;
  bool isEnglishSelected = false;
  bool isFrenchSelected = false;
  bool isJapaneseSelected = false;
  List<String> bahasa = [];
  List<String> genre = [];

  var bahasas = "";
  var genree = "";

  @override
  Widget build(BuildContext context) {
    // var dataID = data.getID();
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference users = db.collection("users");
    final data = Provider.of<olahData>(context, listen: false);
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {},
            child: Container(
              width: 100,
              child: Image.asset(
                "asset/back.png",
              ),
            )),
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
          // Tambahkan SingleScrollView
          child: Center(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, left: 8),
                  ),
                ),
                const Text(
                  'Select Your',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Atur warna teks
                  ),
                ),
                const Text(
                  'Genre',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color:
                        Color.fromARGB(255, 126, 233, 255), // Atur warna teks
                  ),
                ),
                const SizedBox(height: 20),
                // Menggunakan Row untuk susunan genre 3 di sebelah kiri
                Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 32,
                        ),
                        InkWell(
                          onTap: () {
                            genre.add("war");
                          },
                          child: Container(
                            height: 80,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset(
                              "asset/war.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            genre.add("drama");
                          },
                          child: Container(
                            height: 80,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset("asset/band.jpg",
                                fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),
                // Menggunakan Row untuk susunan genre 3 di sebelah kiri
                Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 32,
                        ),
                        InkWell(
                          onTap: () {
                            genre.add("horor");
                          },
                          child: Container(
                            height: 80,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset("asset/chucky1.png",
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            genre.add("Fantasi");
                          },
                          child: Container(
                            height: 80,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset("asset/thomas.jpg",
                                fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),
                // Menggunakan Row untuk susunan genre 3 di sebelah kiri
                Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 32,
                        ),
                        InkWell(
                          onTap: () {
                            genre.add("cinema");
                          },
                          child: Container(
                            height: 80,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset("asset/movies.png",
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            genre.add("romen");
                          },
                          child: Container(
                            height: 80,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset(
                                "asset/Cinderella or Monster.jpg",
                                fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  'Which Movie Language You Prefer?',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: const Color.fromARGB(255, 208, 165, 203),
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildLanguageOption('Indonesian', isIndonesianSelected),
                      _buildLanguageOption('English', isEnglishSelected),
                      _buildLanguageOption('French', isFrenchSelected),
                      _buildLanguageOption('Japanese', isJapaneseSelected),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        for (var bahasass in bahasa) {
                          bahasas = '$bahasas$bahasass, ';
                        }
                        for (var genreek in genre) {
                          genree = '$genree$genreek, ';
                        }
                        users
                            .doc(data.idsignup)
                            .update({'bahasa': bahasas, 'genre': genree});
                        Navigator.pushNamed(context, "/confirm");
                      },
                      child: const Row(
                        children: [
                          Text('Continue To Confirmation',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 163, 64, 166))),
                          Icon(Icons.arrow_circle_right,
                              size: 35,
                              color: Color.fromARGB(255, 163, 64, 166)),
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

  // Membuat widget untuk genre
  Widget _buildGenre(String imageUrl, String genreName) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Handle when genre is tapped
          },
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          genreName,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  // Membuat widget untuk opsi bahasa
  Widget _buildLanguageOption(String language, bool isSelected) {
    return ListTile(
      title: Text(language,
          style: const TextStyle(color: Color.fromARGB(255, 70, 62, 153))),
      trailing: Checkbox(
        value: isSelected,
        onChanged: (bool? value) {
          setState(() {
            switch (language) {
              case 'Indonesian':
                isIndonesianSelected = value!;
                bahasa.add("Indonesian");
                break;
              case 'English':
                isEnglishSelected = value!;
                bahasa.add("English");
                break;
              case 'French':
                isFrenchSelected = value!;
                bahasa.add("French");
                break;
              case 'Japanese':
                isJapaneseSelected = value!;
                bahasa.add("Japanese");
                break;
            }
          });
        },
      ),
      contentPadding: const EdgeInsets.all(0),
    );
  }
}
