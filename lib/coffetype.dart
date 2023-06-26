import 'package:flutter/material.dart';
class coffee_type extends StatelessWidget {
  final String coffetype;
  final bool isselected;
  final VoidCallback ontap;
  const coffee_type({
    super.key, required this.coffetype, required this.isselected, required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: GestureDetector(
        onTap: ontap,
        child: Text(coffetype,style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: isselected?const Color(0xFFcb7c4c):Colors.white,
        ),),
      ),
    );
      //color: Colors.red,

  }
}
