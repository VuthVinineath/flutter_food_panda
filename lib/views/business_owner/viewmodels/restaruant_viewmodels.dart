import 'package:flutter/material.dart';
import 'package:food_panda6/data/reponse/api_response.dart';
import 'package:food_panda6/views/home/repository/restaurant_repo.dart';

class RestaurantViewModel extends ChangeNotifier {
  final _restaruantRepo = RestaurantRepository();
  var response = ApiResponse();

  setRestaurantData(response){
    this.response = response;
    notifyListeners();
  }

  Future<dynamic> postRestaurant(data) async {
    setRestaurantData(ApiResponse.loading());
    await _restaruantRepo.postRestaurant(data)
        .then((isPosted) =>setRestaurantData(ApiResponse.completed(isPosted)))
        .onError((error, stackTrace) => setRestaurantData(ApiResponse.error(stackTrace.toString())));
  }
}