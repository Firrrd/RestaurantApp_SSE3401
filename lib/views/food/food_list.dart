import 'package:flutter/material.dart';

import 'package:restaurant_foodly/common/app_style.dart';
import 'package:restaurant_foodly/common/background_container.dart';
import 'package:restaurant_foodly/common/reusable_text.dart';
import 'package:restaurant_foodly/constants/constants.dart';
import 'package:restaurant_foodly/views/food/widgets/food_tile.dart';

import '../../constants/uidata.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        backgroundColor: kSecondary,
        title: ReusableText(text: "Food List", style: appStyle(16, kLightWhite, FontWeight.w600)),
      ),
      
      body: BackgroundContainer(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView.builder(
                itemCount: foods.length, itemBuilder: (context, i){
                  final food = foods[i];
                  return FoodTile(food: food,);
            }
            ),
          )
      ),
    );
  }
}
