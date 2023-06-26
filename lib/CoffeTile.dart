import 'package:flutter/material.dart';

class CoffeTile extends StatelessWidget {
  final String imagepath;
 final  String type;
 final  String price;
  const CoffeTile({
    super.key, required this.imagepath, required this.type, required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[800],
        ),
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      imagepath,
                      //height: 130,
                     // fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    type,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "With Milk",
                    style: TextStyle(fontSize: 18, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children:  [
                      const Icon(
                        Icons.euro,
                        color: Color(0xFFcb7c4c),
                      ),
                      Text(
                        price,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFcb7c4c),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(Icons.add),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
