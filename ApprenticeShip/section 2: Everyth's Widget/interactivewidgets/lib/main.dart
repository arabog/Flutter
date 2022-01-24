import 'package:flutter/material.dart';

import 'fooderlich_theme.dart';
import 'home.dart';

import 'package:provider/provider.dart';
import 'models/models.dart';

/*
You can pass data around with callbacks or 
provider packages.
If you need to pass data one level up, use callbacks.
If you need to pass data deep in the widget tree, 
use providers.
*/ 

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.light();
    return MaterialApp(
      theme: theme,
      title: 'Fooderlich',
      // TODO 8: Replace this with MultiProvider
      // 1
      home: MultiProvider(
        providers: [
          // 2
          ChangeNotifierProvider(
            create: (context) => TabManager()
          ),

          // TODO 10: Add GroceryManager Provider
          ChangeNotifierProvider(
            create: (context) => GroceryManager() 
          ),
        ],

        child: const Home(),
      ),
      
    );
  }
}
