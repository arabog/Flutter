/*
This chapter focuses on building responsive layouts for Flutter 
applications. The responsive layouts can adjust themselves based 
upon the space available to render their widgets. We will cover 
FittedBox (FittedBox class), Expanded (Expanded class), Flexible 
(Flexible class), FractionallySizedBox (FractionallySizedBox class), 
LayoutBuilder (LayoutBuilder class), and Wrap (Wrap class) widgets.

FittedBox WIDGET
The FittedBox (FittedBox class) widget fits its child within the given 
space during layout to avoid overflows. It positions and scales (or clips) 
its child as per the `fit` property, which helps to fit its child into the 
space allocated during layout. It makes sure that its child sits inside 
the parent widget.
Let’s understand the usage of FittedBox by adding a Row widget 
with two Image widgets as children.

body: Row(
	children: [
		Image.asset("assets/image_pic.png"),
		Image.asset("assets/image_pic.png"),
	],
)

When the code above is added to the `body` of the Scaffold 
widget, the second image overflows to the right of the screen

Wrapping the Row widget in FittedBox makes sure that both 
of the Image widgets are contained inside the FittedBox 
without overflowing out of the screen.

body: FittedBox (
	child: Row (
		children: [
			Image.asset("assets/image_pic.png"),
			Image.asset("assets/image_pic.png"),
		]
	)
)


import 'package:flutter/material.dart';


class FittedBoxApp extends StatelessWidget {
	@override 
	Widget build(BuildContext context) {

		return MaterialApp(
			home: MyIndexedStack(),
		);

	}
}


class MyIndexedStack extends StatefulWidget {
	// MyIndexedStack({Key key}) : super(key: key);

	@override

	_MyIndexedStackState createState() => _MyIndexedStackState();
}



class _MyIndexedStackState extends State<MyIndexedStack> {

	@override
	Widget build(BuildContext context) {

		return Scaffold(
			appBar: AppBar(
				title: Text("FittedBox Widget"),
			),

			body: FittedBox(
				child: Row(

					children: [
						Image.asset("assets/images/image_pic.png"),

						Image.asset("assets/images/image_pic.png"),
					],
				),

			),
		);
	}
}


Expanded WIDGET
The Expanded (Expanded class) widget is a single-child layout widget. 
This layout widget is used for a specific child of the multi-layout widgets 
like Row, Column, and Flex. The child widget wrapped in Expanded widget 
expands to fill the available space along the main axis. It expands horizontally 
for Row parent and vertically for Column parent. It uses a flex factor to let 
the child widget know how much available space they can take up. The child 
wrapped in the Expanded widget takes up all the open space. It uses the `flex` 
property to allocate space in case there is a competition between Expanded 
widgets for available space.


Let’s check out a widget `expandedDefault()` consisting of Row widget and
its three children say `childWidget()`. The `childWidget()` method returns
a widget that’s added as a child to the Row widget. In the code snippet 
below, each child is wrapped in an Expanded widget. Each Expanded 
widget distributes the available horizontal space equally

Widget expandedDefault () {
	return Row (
		children: [
			Expanded (
				child: childWidget("")
			),

			Expanded (
				child: childWidget("")
			),

			Expanded (
				child: childWidget("")
			),
		],
	),
}

*/ 

import 'package:flutter/material.dart';


class ExpandedApp extends StatelessWidget {
	@override 
	Widget build(BuildContext context) {

		return MaterialApp(
			home: ExpandedDefault(),
		);
	}
}


class ExpandedDefault extends StatefulWidget {
	// ExpandedDefault({Key key}) : super(key: key);

	@override

	_ExpandedDefaultState createState() => _ExpandedDefaultState();
}


class _ExpandedDefaultState extends State<ExpandedDefault> {

	@override
	// Widget expandedDefault() {
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("Expanded Widget"),
			),

			body: Row (
				children: [
					Expanded (
						child: childWidget("")
					),

					Expanded (
						child: childWidget("")
					),

					Expanded (
						child: childWidget("")
					),
				],
			),
		);

	}


	Widget childWidget(String text) {
		return Container(

			width: 100,
			height: 100,

			decoration: BoxDecoration(
				image: const DecorationImage(
					image: AssetImage("assets/images/image_pic.png"),

					fit: BoxFit.cover,
				),

				border: Border.all(
					color: Colors.black,

					width: 3,
				),
			),

			child: Text(text),
		);
	}

}








// cont from pg 152