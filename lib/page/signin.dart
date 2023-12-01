import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Olah_data.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});



  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();


  @override
  void initState() {
    super.initState();
    // Lakukan inisialisasi atau langganan sumber daya di sini
  }

  @override
  void dispose() {
    // Lakukan tindakan bersih di sini
    _email.dispose(); 
    _pass.dispose();
    super.dispose(); 
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<olahData>(context, listen: false);

    return Scaffold(
      
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
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Atur warna teks
                      ),
                    ),
                    Text(
                      'Explorer!',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 126, 233,
                            255), // Atur warna teks sesuai keinginan
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email Address',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white)), // Atur warna teks
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                        hintText: 'Type Here',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 92, 195, 232)),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Color.fromARGB(255, 102, 80, 202),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('Password',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white)), // Atur warna teks
                    TextFormField(
                      controller: _pass,
                      decoration: InputDecoration(
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
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () async {
                       setState(() {
                        // dispose();
                      });
                      
                      await data.login(_email.value.text, _pass.value.text);
                      print(data.userAuth!.email);
                          if (data.userAuth != null){

                            if(data.userAuth!.email == _email.text){
                             await data.findDocumentIDByFieldValue();
                              print(data.idlogin);
                                Navigator.pushNamed(context, "/bottomnav");
                                _email.dispose();
                                _pass.dispose();
                                
                  
                            }
                            else{
                              
                              await data.signOut();

                            }
                            
                
                             
                          }
                     
                    },
                    child: Row(
                      children: [
                        Text('Continue To Sign In',
                            style: TextStyle(
                                color: Color.fromARGB(
                                    255, 163, 64, 166))), // Atur warna teks
                        Icon(Icons.arrow_circle_right,
                            size: 35,
                            color: Color.fromARGB(
                                255, 163, 64, 166)), // Atur warna ikon
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/signup");

                      // Navigasi ke halaman pendaftaran baru.
                    },
                    child: Text('Create New Account',
                        style: TextStyle(
                            color: Color.fromARGB(
                                255, 126, 233, 255))), // Atur warna teks
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
