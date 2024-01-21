import 'package:flutter/material.dart';
import 'package:food_panda6/data/reponse/api_response.dart';
import 'package:food_panda6/views/home/models/restaurant.dart';
import 'package:food_panda6/views/home/repository/restaurant_repo.dart';

class RestaurantViewModel extends ChangeNotifier{
  var _restaurantRepo = RestaurantRepository();
  ApiResponse<Restaurant> response = ApiResponse.loading();
  //ApiResponse<dynamic> response = ApiResponse.loading();

  setRestaurantList(response){
    this.response = response;
    notifyListeners();
  }

  Future<dynamic> getAllRestaurant() async{
    await _restaurantRepo.getAllRestaurants()
        .then((restaurant) => setRestaurantList(ApiResponse.completed(restaurant)))
        .onError((error, stackTrace) => setRestaurantList(ApiResponse.error(stackTrace.toString())));
  }
}