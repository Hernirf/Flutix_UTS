import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utsmobile/Booking_provider.dart';
import 'package:utsmobile/models/booking.dart';

import '../api.dart';

class tiketTile extends StatelessWidget {
  final Booking book;
  const tiketTile({super.key, required this.book});
  

  @override
  Widget build(BuildContext context) {
  final bookk = Provider.of<Bookingg>(context, listen: false);

    return InkWell(
      onTap: () {
        bookk.setMovieindex(book);
        Navigator.pushNamed(context, "/ticketdetails");
      },
      child: Container(
        
          child: Row(
            
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15,top: 20),
                child: Container(width:80,height: 100, child: Image.network(book.posterUrl, fit: BoxFit.cover,),),
              ),
              SizedBox(width: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(book.judul_film,style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 20),), Text("${book.tanggal}, ${book.waktu}",style: TextStyle(color: Colors.white),), Text(book.tempat,style: TextStyle(color: Colors.white),)],
              ),
            ],
          ),
        ),
    );
  }
}