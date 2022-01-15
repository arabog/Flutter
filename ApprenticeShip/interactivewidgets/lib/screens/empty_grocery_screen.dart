import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../models/models.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // todo 3 replace and add layout widgets
    // return Container(color: Colors.purple);
    // 1
    return Padding(
      padding: const EdgeInsets.all(30.0),
      // 2
      child: Center(
        // 3
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO 4: Add empty image
            Text(
              'No Groceries',
              style: Theme.of(context).textTheme.headline6,
            ),
            // 1
            Flexible(
              // 2
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset('assets/fooderlich_assets/empty_list.png'),
              ),
            ),
            // TODO 5: Add empty screen title
            // TODO 6: Add empty screen subtitle
            const SizedBox(height: 16.0),

            const Text(
              'Shopping for ingredients?\n'
              'Tap the + button to write them down!',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16.0),

            // TODO 7: Add browse recipes button
            MaterialButton(
              textColor: Colors.white,
              child: const Text('Browse Recipes'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.green,
              onPressed: () {
                // todo 8 go to recipes tap
                Provider.of<TabManager>(context, listen: false).goToRecipes();
              },
            ),
          ],
        ),
      ),
    );
  }
}
