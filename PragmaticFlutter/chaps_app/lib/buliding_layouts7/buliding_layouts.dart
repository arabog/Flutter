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

Multi-child: Multiple children can be added to this type of layout 
widgets. Few examples are: Column (Column class), Row (Row class), 
Flex (Flex class), ListView (ListView class), GridView (GridView class), 
Stack (Stack class), IndexedStack (IndexedStack class), Flow (Flow 
class), LayoutBuilder (LayoutBuilder class), ListBody (ListBody class),
Table (Table class), Wrap (Wrap class).

Container WIDGET
The Container (Container class) widget is a simple and versatile layout 
widget. It can hold only one child as its descendant. It has versatile 
properties that can be leveraged to style its child widget to change the 
background color or shape and size. By default, it aligns itself to the 
top-left corner of the screen.

Let’s add a Text widget with ‘Hello Container’ text as its child. The 
TextStyle(Flutter Team, 2020) is applied to make the text’s font ‘30’.

Container(
	child: Text(
		"Hello Container",
		style: TextStyle(fontSize: 30),
	),
),

You wouldn’t notice any difference right after adding a widget as a 
child unless you use parameters/properties like color, padding, etc. 
Let’s check out some of the Container widget’s properties next


Color Property
The Container layout widget’s color property (color property) is 
used to highlight the background of the widget,

Container(
	color: Colors.red,

	child: Text(
		"Hello Container",
		style: TextStyle(fontSize: 30),
	),
),

Padding P roperty
The padding property (padding property) adds empty space between 
the child widget and the Container (Container class) widget’s boundary, 
The EdgeInsetsGeometry (EdgeInsetsGeometry class) is used to
provide the padding of ‘16’ points from all four sides.

Container(
	padding: const EdgeInsets.all(16.0),

	child: Text(
		"Hello Container",
		style: TextStyle(fontSize: 30),
	),
),

Margin Property
The margin property (margin property) is used to add space 
around the Container widget

Container(
	margin: const EdgeInsets.all(20.0),

	child: Text(
		"Hello Container",
		style: TextStyle(fontSize: 30),
	),
),

Alignment Property
The `alignment` property (alignment property) is used to align the child 
within the Container widget. The `Alignment.center` takes the parent 
widget’s width and height, which can be constrained using the width 
and height property of the Container widget or using the BoxConstraints 
(BoxConstraints class). The widget expands to fill the parent’s size.

Container(
	alignment: Alignment.center,

	child: Text(
		"Hello Container",
		style: TextStyle(fontSize: 30),
	),
),





cont on pg 108
*/ 


import 'package:flutter/material.dart';

class LayoutApp extends StatelessWidget {
	@override 
	Widget build(BuildContext context) {

		return MaterialApp(
			home: MyHomePage(title: 'Layout App'),
		);

	}
}


class MyHomePage extends StatefulWidget {
	MyHomePage({Key key, this.title}) : super(key: key);

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

			body: Container(
				color: Colors.red,

				padding: const EdgeInsets.all(16.0),

				margin: const EdgeInsets.all(20.0),

				alignment: Alignment.center,

				child: Text (
					"Hello Container",

					style: TextStyle(fontSize: 30),
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


