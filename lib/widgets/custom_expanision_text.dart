import 'package:flutter/material.dart';

class CustomExText extends StatelessWidget {
final String title;
final String value;
final TextStyle?style;
final TextStyle?valueStyle;

  const CustomExText({super.key, required this.title, required this.value,this.style,  this.valueStyle, });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(title,style: style,),
          
          Text(value,style: valueStyle)
        ],
      ),
    );
  }
}