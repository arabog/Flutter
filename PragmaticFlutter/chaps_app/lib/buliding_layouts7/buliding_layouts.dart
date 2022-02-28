/*
mport 'package:flutter/material.dart';

class HelloBooksApp extends StatelessWidget {
	@override 
	Widget build(BuildContext context) {

		return MaterialApp(
			home: MyHomePage(title: 'Hello Books'),
		);

	}
}


class MyHomePage extends StatefulWidget {
	MyHomePage({Key? key, required this.title}) : super(key: key);

	final String title;

	_MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(

			appBar: AppBar(
				// centerTitle: true,

				// title: Text("Hello Books")

				title: Center(
					child: Text('Hello Books'),
				),
			),

			body: Center(
				child: Text (
					"Hello Books",

					style: Theme.of(context).textTheme.headline4,
				),

				
			),

			floatingActionButton: FloatingActionButton (
				onPressed: () {},

				tooltip: "Greeting",

				child: Icon(Icons.insert_emoticon),
			),

		);
	}
}

Layout Widget
In the HelloBooksApp, the greeting text is displayed in the middle 
of the screen. We need a layout widget (Layout Widgets) to hold 
the visible widget displaying the text.
The Center (Center class) layout widget centers its child horizontally 
and vertically inside it.
```
Center()

Visible Widget
The Text widget displays the greeting text.
```
Text(
	'Hello Books',
	style: Theme.of(context).textTheme.headline4,
),



Adding Visible Widget to Layout Widget
The layout Center widget is more like a container. We need to 
add a visible widget as its descendant. At this point, we have got 
a layout with a visible text string.
```
Center(
	child: Text(
		'Hello Books',
		style: Theme.of(context).textTheme.headline4,
	),
)

Adding A Layout Widget to MaterialApp
The last step is to add the layout widget to the MaterialApp. The 
MaterialApp provides the Scaffold widget that provides application 
programming interfaces(APIs) to add app bars, bottom sheets, 
navigation drawer, etc. The `body` property adds the layout widget 
for the main screen.

MaterialApp(
	home: Scaffold(
		body: Center(
			child: Text(
				'Hello Books',
				style: Theme.of(context).textTheme.headline4,
			),
		),
	),
);

In this section, you learned how to add layout widgets in a material 
Flutter app using the Center widget. In the rest of the chapter, you’ll 
explore other layout widgets which are helpful in arranging widgets 
as per the app’s design needs


TYPES OF LAYOUT WIDGETS
There are two types of layout widgets: Single & Multi-child 

Single child: There can be only one child added for these layouts. 
Few examples are: Center (Center class), Container (Container 
class), Padding (Padding class), ConstrainedBox (ConstrainedBox 
class), Expanded (Expanded class), Flexible (Flexible class), 
FittedBox (FittedBox class), FractionallySizedBox 
(FractionallySizedBox class), IntrinsicHeight (IntrinsicHeight 
class), IntrinsicWidth (IntrinsicWidth class), LimitedBox 
(LimitedBox class), OverflowBox (OverflowBox class), 
SizedOverflowBox (SizedOverflowBox class), SizedBox (SizedBox 
class), and Transform (Transform class).





cont on pg 108
*/ 