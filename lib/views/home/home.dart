import 'dart:io';

import 'package:flutter/material.dart';
import 'widgets/drawer.dart';
import 'widgets/resturant_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  /// Main container decoration
  final boxDecoration = BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.circular(10));

  /// Container Margin
  final mainContainerMargin =
      EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20); // margin

  /// Sub-Container padding
  final childPadding =
      const EdgeInsets.only(top: 15, left: 15, right: 5, bottom: 5);

  /// Sub-Title
  final subTitle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('2 St 24'),
            Text('Phnom Penh', style: TextStyle(fontSize: 12)),
          ],
        ),
        // leadingWidth: 35,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_basket))
        ],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Food Delivery Section
            Container(
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  Container(
                    margin: mainContainerMargin,
                    width: double.infinity,
                    // height: 220,
                    decoration: boxDecoration,
                    child: Padding(
                      padding: childPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Food delivery',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                          Text('Order food you love',
                              style: TextStyle(fontSize: 15)),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Image.asset(
                              'assets/images/soup.jpg',
                              fit: BoxFit.contain,
                              width: 150,
                              height: 100,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  /// 2nd Section
                  Container(
                    margin: EdgeInsets.only(
                        top: 0, left: 20, right: 20, bottom: 20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: childPadding,
                            margin: EdgeInsets.only(right: 5),
                            decoration: boxDecoration,
                            height: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Groceries',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('Supermarkets,Marts, Shops, & more',
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Image.network(
                                    'https://img.freepik.com/free-vector/cocktail-glass-white-background_1308-111493.jpg?w=826&t=st=1703405386~exp=1703405986~hmac=40b0f1aa4ce8ad9c874ebf899fe5ee00ac32947c40f6256b1f0f5599d58666c6',
                                    height: 100,
                                    fit: BoxFit.contain,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 300,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: childPadding,
                                      margin:
                                          EdgeInsets.only(left: 5, bottom: 5),
                                      decoration: boxDecoration,
                                      height: 300,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Pick-up',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text('Up to 50% off',
                                                    style: TextStyle(
                                                        fontSize: 15)),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Image.network(
                                              'https://img.freepik.com/free-vector/cute-woman-men-holding-cardboard-money-ready-deliver-character-cartoon-art-illustration_56104-779.jpg?w=996&t=st=1703407355~exp=1703407955~hmac=8885f125473fe6033ae0b7122376a5b69e4ae08474e08c91a6b046c13b172401',
                                              height: 100,
                                              fit: BoxFit.contain,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: childPadding,
                                        margin:
                                            EdgeInsets.only(left: 5, top: 5),
                                        decoration: boxDecoration,
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'pandasend',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    'Send parcels \n in a tap'),
                                                Image.asset(
                                                  'assets/images/burger.jpg',
                                                  fit: BoxFit.contain,
                                                  width: 50,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Recommend Food
            Padding(
              padding: EdgeInsets.only(top: 20,left: 20),
              child: Container(
                alignment: Alignment.topLeft,
                  child:
                  Text('Recommended For You', style: subTitle)),
            ),
            SizedBox(
              height: 350,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => ResturantCard()),
            )
          ],
        ),
      ),
    );
  }
}
