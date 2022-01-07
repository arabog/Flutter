import 'package:flutter/material.dart';
// 1
import 'fooderlich_theme.dart';

import 'home.dart';

void main() {
  // 1
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //2 TODO: Create theme
    final theme = FooderlichTheme.dark();
    //  TODO: Apply Home widget
    return MaterialApp(
      theme: theme,
      title: 'Fooderlich',
      home: const Home(),
    );

    // return MaterialApp(
    //   // 3 TODO: Add theme
    //   theme: theme,

    //   title: 'Fooderlich',

    //   home: Scaffold(
    //     // TODO: Style the title
    //     appBar: AppBar(
    //       title: Text(
    //         'Fooderlich',
    //         // 4
    //         style: theme.textTheme.headline6,
    //       ),
    //     ),

    //     // TODO: Style the body text
    //     body: Center(
    //       child: Text('Let\'s get cooking 👩‍🍳',
    //           // 5
    //           style: theme.textTheme.headline1),
    //     ),
    //   ),
    // );
  }
}
