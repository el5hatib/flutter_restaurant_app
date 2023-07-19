import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(selectedMeal.title,
              style: Theme.of(context).textTheme.titleLarge),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.all(10.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                elevation: 8,
                shadowColor: const Color(0xff6495ed),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    selectedMeal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            buildTitle(context, "Ingredients"),
            Container(
              height: 230,
              width: 400,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xff051537),
                border: Border.all(color: const Color(0xff003D7A)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: Theme.of(context).textTheme.bodyLarge,
                      )),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildTitle(context, "Steps"),
            Container(
              height: 230,
              width: 400,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xff051537),
                border: Border.all(color: const Color(0xff003D7A)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const Divider(
                      color: Color(0xff003D7A),
                    ),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }

  Container buildTitle(BuildContext context,String title) {
    return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
  }
}
