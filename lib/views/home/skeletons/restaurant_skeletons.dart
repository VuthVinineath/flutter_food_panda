import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RestaurantSkeleton extends StatelessWidget {
  const RestaurantSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        margin: EdgeInsets.only(top: 16, left: 16),
        width: MediaQuery.of(context).size.width * .75,
        // get width 75% of screen
        height: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Stack
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width * .75,
                      height: 220,
                    )),
                Positioned(
                  top: 15,
                  child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          //
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
                Text('5-20 mn   \$ delivery fee',
                    style: TextStyle(fontSize: 15))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
