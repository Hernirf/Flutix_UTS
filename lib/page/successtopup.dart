import 'package:flutter/material.dart';

class successtopup extends StatefulWidget {
  const successtopup({super.key});

  @override
  State<successtopup> createState() => _successtopupState();
}

class _successtopupState extends State<successtopup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 360,
                height: 660,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: 100,bottom: 50),child: Image.asset("asset/success.png"),),
            
            Text("Wallet is Ready!",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text("You have successfully",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.normal)),
            Text("feed your wallet",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.normal)),
            Padding(padding: EdgeInsets.only(top: 100)),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/mywallet');
            }, child: Text("MyWallet",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF6650CA),padding: EdgeInsets.symmetric(horizontal: 70,vertical: 15)),),
            SizedBox(height: 20,),
            TextButton( onPressed: () {
              Navigator.pushNamed(context, '/bottomnav');
            }, child: Text("Back to Home",style: TextStyle(color: Color(0xFFAEAEAE)))),
          ],

          
        ),
      ),
    );
  }
}