import 'package:flutter/material.dart';
import 'package:food_panda6/res/app_url.dart';
import 'package:food_panda6/views/business_owner/add_restaurant.dart';
import 'package:food_panda6/views/home/models/restaurant.dart';

class ResturantCard extends StatelessWidget {
 ResturantCard({
    this.restaurant
  });

  Datum? restaurant;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddRestaurant()));
      },
      child: Container(
        margin: EdgeInsets.only(top:16,left: 16),
        width: MediaQuery.of(context).size.width * 0.75, // get width 75% of screen
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
                      '${AppUrl.baseUrl}${restaurant!.attributes!.picture!.data!.attributes!.url}',
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 250,
                )),
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
                        '${restaurant!.attributes!.discount}% OFF',
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
                  restaurant!.attributes!.name.toString() ?? "default value",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$\$\$. ${restaurant!.attributes!.category}',
                  style: TextStyle(fontSize: 15),
                ),
                Text('${restaurant!.attributes!.deliveryTime} mn  ${restaurant!.attributes!.deliveryFee} \$', style: TextStyle(fontSize: 15))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
