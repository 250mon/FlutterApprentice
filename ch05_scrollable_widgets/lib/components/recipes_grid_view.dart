import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';

class RecipesGridView extends StatelessWidget {
  final List<SimpleRecipe> recipes;

  const RecipesGridView({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1
          ),
          itemBuilder: (context, index) {
            final simpleRecipe = recipes[index];
            return RecipeThumbnail(recipe: simpleRecipe);
          },
          itemCount: recipes.length,
        ),
    );
  }
}