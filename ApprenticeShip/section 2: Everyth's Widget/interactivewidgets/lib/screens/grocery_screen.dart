import 'package:flutter/material.dart';

import 'empty_grocery_screen.dart';

import 'package:provider/provider.dart';
import '../models/models.dart';

import 'grocery_item_screen.dart';

import 'grocery_list_screen.dart';


class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // todo2 replace with emptygrocery screen
    // return const EmptyGroceryScreen();

    // TODO 4: add a scaffold widget
    // 5
    return Scaffold(
      // 6
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // todo 11 present grocery item screen
          // 1
          final manager = Provider.of<GroceryManager>(
            context, 
            listen: false
          );

          // 2
          Navigator.push(
            context,

            // 3
            MaterialPageRoute(
              // 4
              builder: (context) => GroceryItemScreen(
                // 5
                onCreate: (item) {
                  // 6
                  manager.addItem(item);

                  // 7
                  Navigator.pop(context);
                },

                onUpdate: (item) {},
              ),
            ),
          );
        },
      ),

      body: buildGroceryScreen(),
    );
  }

  // todo add buildgrocery screen
  Widget buildGroceryScreen() {
    // 1
    return Consumer<GroceryManager>(
      // 2
      builder: (context, manager, child) {
        // 3
        if (manager.groceryItems.isNotEmpty) {
          // todo 25 add groceryListScreen
            return GroceryListScreen(manager: manager);

          // return Container();
        } else {
          // 4
          return const EmptyGroceryScreen();
        }
      },
    );
  }
}
