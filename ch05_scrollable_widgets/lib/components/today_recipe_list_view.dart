import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';

class TodayRecipeListView extends StatelessWidget {
  final List<ExploreRecipe> recipes;

  const TodayRecipeListView({
    super.key,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recipes of the Day',
            style: Theme.of(context).textTheme.displayLarge
          ),
          const SizedBox(height: 16),
          Container(
            height: 400,
            color: Colors.transparent,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return buildCard(recipe);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 16);
                },
                itemCount: recipes.length,
                scrollDirection: Axis.horizontal,
            )
          ),
        ],
      ),
    );
  }

  Widget buildCard(ExploreRecipe recipe) {
    return switch (recipe.cardType) {
      RecipeCardType.card1 => Card1(recipe: recipe),
      RecipeCardType.card2 => Card2(recipe: recipe),
      RecipeCardType.card3 => Card3(recipe: recipe),
      _ => throw Exception()
    };
  }
}