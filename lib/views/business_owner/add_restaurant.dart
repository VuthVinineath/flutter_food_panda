import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_panda6/res/app_url.dart';
import 'package:food_panda6/views/business_owner/models/request/restaurant_request.dart';
import 'package:food_panda6/views/business_owner/viewmodels/image_viewmodels.dart';
import 'package:food_panda6/views/business_owner/viewmodels/restaruant_viewmodels.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:food_panda6/data/reponse/status.dart';

class AddRestaurant extends StatefulWidget {
  // const ({super.key});
  @override
  State<AddRestaurant> createState() => _AddRestaurantState();
}

class _AddRestaurantState extends State<AddRestaurant> {
  var imageFile;
  bool isPicked = false;
  var imageID;

  /// Mark : ViewModel
  final _imageViewModel = ImageViewModels();
  final _restaurantViewModel = RestaurantViewModel();

  /// Mark : Controller
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final discountController = TextEditingController();
  final deliveryController = TextEditingController();
  final timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                /// Mark : Image
                Align(
                  alignment: Alignment.center,
                  child: ChangeNotifierProvider(
                    create: (context) => _imageViewModel,
                    child: Consumer<ImageViewModels>(
                      builder: (context, viewModel, _) {
                        if (viewModel.response.status == null) {
                          return InkWell(
                              onTap: () {
                                _getImageFromSource(source: 'camera');
                              },
                              child: Image.network(
                                  'https://www.shutterstock.com/image-vector/vector-flat-illustration-grayscale-avatar-600nw-2281862025.jpg',
                                  fit: BoxFit.contain));
                        }
                        switch (viewModel.response.status!) {
                          case Status.LOADING:
                            return const Center(
                                child: CircularProgressIndicator());
                          case Status.COMPLETE:
                            imageID = viewModel.response.data[0].id;
                            return InkWell(
                              onTap: () {
                                _getImageFromSource(source: 'camera');
                              },
                              child: SizedBox(
                                  width: 350,
                                  height: 250,
                                  child: Image.network(
                                    '${AppUrl.baseUrl}${viewModel.response.data[0].url!}',
                                    fit: BoxFit.contain,
                                  )),
                            );
                          case Status.ERROR:
                            return Text('Error');
                        }
                      },
                    ),
                  ),
                ),

                /// Mark : Name
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: 'Name', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 10),

                /// Mark : Category
                TextField(
                  controller: categoryController,
                  decoration: InputDecoration(
                      hintText: 'Category', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 10),

                /// Mark : Discount
                TextField(
                  controller: discountController,
                  decoration: InputDecoration(
                      hintText: 'Discount', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 10),

                /// Mark : Delivery Fee
                TextField(
                  controller: deliveryController,
                  decoration: InputDecoration(
                      hintText: 'Delivery Fee', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 10),

                /// Mark : Time
                TextField(
                  controller: timeController,
                  decoration: InputDecoration(
                      hintText: 'Time', border: OutlineInputBorder()),
                ),

                /// Mark : Button
                ChangeNotifierProvider(
                  create:(context) => _restaurantViewModel,
                  child: Consumer<RestaurantViewModel>(
                    builder: (context, viewModel, _) {
                      if (viewModel.response.status == null){
                        return ElevatedButton(
                            onPressed: () {
                              _saveRestaurant();
                            },
                            child: Text('Save'));
                      }
                      switch (viewModel.response.status!) {
                        case Status.LOADING:
                          return const Center(child: CircularProgressIndicator());
                        case Status.COMPLETE:
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Post Success")));
                          });
                          return ElevatedButton(
                              onPressed: () {
                                _saveRestaurant();
                              },
                              child: Text('Save'));
                        case Status.ERROR:
                          return Text(viewModel.response.message!);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Mark : For getting image from gallery
  _getImageFromSource({source}) async {
    XFile? pickedFile = await ImagePicker().pickImage(
        source: source == "gallery" ? ImageSource.gallery : ImageSource.camera);

    if (pickedFile != null) {
      /// Mark : Uploading Image to Server
      _imageViewModel.uploadImage(pickedFile.path);

      // setState(() {
      //   isPicked = true;
      //   imageFile = File(pickedFile.path);
      // });
      print('Picked File: ${File(pickedFile.path)}');
    }
  }

  void _saveRestaurant() {
    var restaruantRequest = RestaurantRequest(
        data: Data(
            name: nameController.text,
            category: categoryController.text,
            discount: int.parse(discountController.text),
            deliveryFee: double.parse(deliveryController.text),
            deliveryTime: int.parse(timeController.text),
            picture: imageID.toString()));
    _restaurantViewModel.postRestaurant(restaruantRequest);
    print('name : ${nameController.text}');
    print('name : ${categoryController.text}');
    print('name : ${discountController.text}');
    print('name : ${deliveryController.text}');
    print('name : ${timeController.text}');
    print('picture : ${imageID.toString()}');
  }
}
