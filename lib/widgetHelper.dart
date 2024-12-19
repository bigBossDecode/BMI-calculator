import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class widgetHelper {
  CardLayout(
      {required String imageUrl,
      required Color cardColor,
      required String text}) {
    return Card(
      elevation: 4.0,
      color: cardColor,
      child: Container(
        alignment: Alignment.center,
        width: 135,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image(
                image: AssetImage(imageUrl),
                height: 80,
                width: 80,
              ),
            ),
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  CustomButton({required VoidCallback onClick, required IconData icon}) {
    return IconButton(
      highlightColor: Colors.lightBlue,
      style: IconButton.styleFrom(
        backgroundColor: Colors.blueAccent
      ),
      onPressed: onClick,
      icon: Icon(
        icon,
        color: Colors.white,
        size: 25,
      ),
    );
  }
}
