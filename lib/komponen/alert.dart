import 'package:flutter/material.dart';
class alert {
  alert(){}

  void showAlert(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('pemberitahuan'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Tutup dialog
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
}