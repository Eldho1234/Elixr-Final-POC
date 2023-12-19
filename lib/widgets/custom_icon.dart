import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
final IconData iconData;
final String iconTitle;
final Color? color;
final VoidCallback onTap;

 CustomIcon({super.key, required this.iconData, required this.iconTitle, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
           Icon(iconData,color: color,),
           Text(iconTitle)
        ],
      ),
    );
  }
}