import 'package:flutter/material.dart';

import '../models/wallets.dart';

class walletsTile extends StatelessWidget {
  final Wallet wallet;
  const walletsTile({super.key, required this.wallet});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(

            children: [
               SizedBox(
                height: 20,),
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   wallet.keterangan,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${wallet.tanggal}, ${wallet.pukul}",
                    style: TextStyle(
                        color: Colors.white, fontSize: 14),
                  ),
                  Text(
                    wallet.jumlah.toString(),
                    style: TextStyle(
                        color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
    );
  }
}