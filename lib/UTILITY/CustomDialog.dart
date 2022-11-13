import 'package:flutter/material.dart';

class CustomWidgets {
  snackBarWidget(context, String msg, IconData icons, Color iconcolor, int time,
      Color bgcolor) {
    final snackbar = SnackBar(
      elevation: 1,
      behavior: SnackBarBehavior.fixed,
      backgroundColor: bgcolor,
      duration: Duration(seconds: time),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            msg,
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w500, color: iconcolor),
          ),
          Icon(
            icons,
            color: iconcolor,
          )
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
