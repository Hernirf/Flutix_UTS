import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utsmobile/Booking_provider.dart';
import 'package:utsmobile/Olah_data.dart';
import 'package:utsmobile/models/booking.dart';

import '../api.dart';
import '../models/movie.dart';

class ticketdetails extends StatefulWidget {
  const ticketdetails({super.key});

  @override
  State<ticketdetails> createState() => _ticketdetailsState();
}

class _ticketdetailsState extends State<ticketdetails> {
  @override
  Widget build(BuildContext context) {
    
    final book = Provider.of<Bookingg>(context, listen: false);
    final data = Provider.of<olahData>(context, listen: false);

    final Booking bookMy = book.myMovieDetail;

    return Scaffold(
      appBar: AppBar(
        
        leading: InkWell(onTap: (){
          // Navigator.pushNamed(context, '/myticket');
          Navigator.pushNamed(context, '/bottomnav1');

        },child: Image.asset("asset/back.png"),),
        titleSpacing: 50,
        title: Text("Ticket",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            
        backgroundColor: Color.fromARGB(255, 149, 0, 194),
      ),
      body: Container(
        width: 360,height: 660,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
                  Color.fromARGB(255, 149, 0, 194),
                  Color.fromARGB(255, 39, 26, 84),
                ],),
          ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                    child: Container(
                      child: Image.network(bookMy.posterUrl),
                    ),),
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(bookMy.judul_film,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,),),
                ),
                Padding(padding: EdgeInsets.only(left: 25),child: Text("Horor",style: TextStyle(color: Colors.white),),),
                Padding(
                  padding: EdgeInsets.only(left: 20,top: 5),
                  child: Container( width: 180,
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("asset/bintang.png"),
                        Text("4/5",style: TextStyle(color: Colors.white),),
                      ],
                    )
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(left: 0),child: Text("Cinema",style: TextStyle(color: Colors.white),),),
                        Padding(padding: EdgeInsets.only(left: 0),child: Text("Date & Time",style: TextStyle(color: Colors.white),),),
                        Padding(padding: EdgeInsets.only(left: 0),child: Text("Seat",style: TextStyle(color: Colors.white),),)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(padding: EdgeInsets.only(left: 0),child: Text(bookMy.tempat,style: TextStyle(color: Colors.white),),),
                        Padding(padding: EdgeInsets.only(left: 0),child: Text('${bookMy.tanggal}, ${bookMy.waktu}',style: TextStyle(color: Colors.white),),),
                        Padding(padding: EdgeInsets.only(left: 0),child: Text(bookMy.kursi,style: TextStyle(color: Colors.white),),)
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(left: 0),child: Text("Name",style: TextStyle(color: Colors.white),),),
                        Padding(padding: EdgeInsets.only(left: 0),
                        child: StreamBuilder<DocumentSnapshot>(
                          stream: data.users.doc(data.idlogin).snapshots(),
                          builder: (context, snapshot) {
                            return Text(snapshot.data!.get("fullname"),style: TextStyle(color: Colors.white),);
                          }
                        ),),
                        Padding(padding: EdgeInsets.only(left: 0),child: Text("Price",style: TextStyle(color: Colors.white),),),
                        Padding(padding: EdgeInsets.only(left: 0),child: Text(bookMy.total_tiket.toString(),style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),),
                        Padding(padding: EdgeInsets.only(left: 0),child: Text("ID Order",style: TextStyle(color: Colors.white),),),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(child: Image.asset("asset/qr.png"),),   
                        Padding(padding: EdgeInsets.only(left: 0),child: Text(bookMy.id_order,style: TextStyle(color: Colors.white),),),                                   
                        ],
        
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}