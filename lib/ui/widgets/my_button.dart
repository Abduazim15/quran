
import 'package:flutter/material.dart';

class myNavigateButton extends StatelessWidget {
  const myNavigateButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.startColor,
    required this.endColor,
  });

  final String title;
  final String subtitle;
  final Color startColor;
  final Color endColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: startColor.withOpacity(0.5),width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(20),),
        gradient: LinearGradient(
            colors: [startColor.withOpacity(0.8), endColor.withOpacity(0.1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22),
          ),
          Text(
            subtitle,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
