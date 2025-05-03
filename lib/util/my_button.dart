import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String iconImagePath;
  final String buttonText;
  final VoidCallback? onTap;

  const MyButton(
      {super.key,
      required this.iconImagePath,
      required this.buttonText,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          // Icon
          Container(
            height: 90,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              //color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 30,
                  spreadRadius: 10,
                )
              ],
            ),
            child: Center(
              child: Image.asset(iconImagePath),
            ),
          ),
          SizedBox(height: 4),
          // Text
          Text(
            buttonText,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
