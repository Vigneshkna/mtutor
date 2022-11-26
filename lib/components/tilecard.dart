import 'package:flutter/material.dart';

class TileCard extends StatelessWidget {
  final String title;

  const TileCard({
    Key? key,
    required this.title,
  })  : assert(title != ''),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
      print(title);
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            child: const Icon(Icons.ac_unit, size: 24, color:Colors.blueAccent),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
            ),
            padding: const EdgeInsets.all(12),
            child: Text(title),
          )
        ],
      ),
    ));
  }
}
