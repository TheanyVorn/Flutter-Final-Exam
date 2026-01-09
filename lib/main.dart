import 'package:flutter/material.dart';

import 'models/restaurant.dart';
import 'models/restaurant_type.dart';
import 'ui/screens/restaurants_view.dart';
import 'ui/screens/restaurant_comments_view.dart';
import 'ui/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppColors.main,
      debugShowCheckedModeBanner: false,
      home: RestaurantsView(restaurants: allRestaurants),
    );
  }

  List<Restaurant> get allRestaurants {
    List<Restaurant> result = [
      Restaurant(
        name: 'Flutter Burger',
        address: 'Phnom Penh',
        type: RestaurantType.khmer,
        rating: 0.0,
      ),

      Restaurant(
        name: 'Les croissants de Ronan',
        address: 'Prey Veng',
        type: RestaurantType.khmer,
        rating: 0.1,
      ),

      Restaurant(
        name: 'La Pizza Del Ronano (the best)',
        address: 'Kandal',
        type: RestaurantType.italian,
        rating: 0.2,
      ),

      Restaurant(
        name: 'Final Tacos',
        address: 'Kompong Cham',
        type: RestaurantType.mexican,
        rating: 0.3,
      ),

      Restaurant(
        name: 'Theany Chicken Run',
        address: 'Siem Reap',
        type: RestaurantType.khmer,
        rating: 0.4,
      ),
    ];
    return result;
  }
}
