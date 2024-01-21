import 'package:food_panda6/data/network/api_service.dart';
import 'package:food_panda6/res/app_url.dart';
import 'package:food_panda6/views/business_owner/models/request/restaurant_request.dart';
import '../models/restaurant.dart';

class RestaurantRepository {
  var apiService = ApiService();

  /// Mark : PostRestaurant
  Future<bool> postRestaurant(data) async{
    var restaurantRequest = restaurantRequestToJson(data);
    dynamic response = await apiService.postRestaurant(AppUrl.postRestaurant,restaurantRequest);
    return response;
  }
  Future<Restaurant> getAllRestaurants() async{
    try{
      dynamic response = await apiService.getApi(AppUrl.getAllRestaurants);
      return restaurantFromJson(response);
    } catch(exception){
      rethrow;
    }

  }
}