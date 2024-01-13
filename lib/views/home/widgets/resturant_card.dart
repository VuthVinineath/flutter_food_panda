import 'package:flutter/material.dart';

class ResturantCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:16,left: 16),
      width: MediaQuery.of(context).size.width * .75, // get width 75% of screen
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Stack
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                    'https://images.deliveryhero.io/image/fd-kh/LH/t4qx-hero.jpg?width=512&height=384&quality=45'),
              ),
              Positioned(
                top: 15,
                child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Text(
                      '15% OFF',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TUBE COFFEE',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$. Text & Coffee',
                style: TextStyle(fontSize: 15),
              ),
              Text('5-20 mn   \$ delivery fee', style: TextStyle(fontSize: 15))
            ],
          ),
        ],
      ),
    );
  }
}
