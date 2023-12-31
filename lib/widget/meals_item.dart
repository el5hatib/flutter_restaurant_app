import 'package:flutter/material.dart';

import '../model/meal.dart';
import '../screen/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.id,
  });

  String? get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
    }
    return null;
  }

  String? get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return "Unknown";
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    )
        .then((result) {
     /*if (result != null) {
        removeItem(result);
     }*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        shadowColor: const Color(0xff6495ed),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            buildMealImage(context),
            buildMealSimpleData(),
          ],
        ),
      ),
    );
  }

  Row buildMealSimpleData() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            const Icon(
              Icons.schedule,
              color: Color(0xff4682B4),
            ),
            const SizedBox(width: 6),
            Text('$duration min'),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.work,
              color: Color(0xff4682B4),
            ),
            const SizedBox(width: 6),
            Text(complexityText!),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.attach_money,
              color: Color(0xff4682B4),
            ),
            const SizedBox(width: 6),
            Text(affordabilityText!),
          ],
        ),
      ],
    );
  }

  Stack buildMealImage(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Image.network(
            imageUrl,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 20,
          right: 10,
          child: Container(
            width: 300,
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(15),
              backgroundBlendMode: BlendMode.dstATop,
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ],
    );
  }
}
