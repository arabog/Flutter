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



Expanded with ` flex` Property
In the example below, each child is wrapped in an Expanded 
widget as well as uses its `flex` property. Each of the children 
takes up the space based on the value of `flex` property. The 
first child is assigned `flex` as four, the second is assigned
three, and the third child has `flex` property as one. In this 
case, the total space will be eight parts (4 + 3 + 1 = 8). 

body: Row (
	children: [
		Expanded (
			flex: 4,
			child: childWidget("")
		),

		Expanded (
			flex: 3,
			child: childWidget("")
		),

		Expanded (
			flex: 1,
			child: childWidget("")
		),
	],
)


Flexible WIDGET
The Flexible (Flexible class) widget is similar to the Expand widget 
but with a twist. It lets a child of Row, Column, and Flex layout 
widgets expand in the available space based on the constraint 
using the `flex` property. Flexible widgets only take space for 
how much is declared using the `flex` property. They don’t claim 
extra available space by default.

The `FlexFit.tight` Property
The `FlexFit.tight` forces the children to take up all the entire 
available space. 

The Flexible widget behaves like the Expand widget when its 
`fit` property is set to `FlexFit.tight`. The `Expanded(child: Text())` 
is the same as `Flexible(fit: FlexFit.tight, child: Text()).

In the code snippet below, the three children of the Row widget 
are assigned four, three, and one out of eight parts, respectively. 
When the `fit` property is set to `FlexFit.tight`, they take the space 
assigned to each of them while filling up the available space horizontally.

body: Row (
	children: [
		Flexible (
			fit: FlexFit.tight,
			flex: 4,
			child: childWidget("4/8")
		),

		Flexible (
			fit: FlexFit.tight,
			flex: 3,
			child: childWidget("3/8")
		),

		Flexible (
			fit: FlexFit.tight,
			flex: 1,
			child: childWidget("1/8")
		),
	]
)


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
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("Expanded Widget"),
			),

			// FittedBox
			// body: FittedBox(
			// 	child: Row(

			// 		children: [
			// 			Image.asset("assets/images/image_pic.png"),

			// 			Image.asset("assets/images/image_pic.png"),
			// 		],
			// 	),

			// ),

			// Expanded
			// body: Row (
			// 	children: [
			// 		Expanded (
			// 			child: childWidget("")
			// 		),

			// 		Expanded (
			// 			child: childWidget("")
			// 		),

			// 		Expanded (
			// 			child: childWidget("")
			// 		),
			// 	],
			// ),

			// Expanded with flex ppty
			// body: Row (
			// 	children: [
			// 		Expanded (
			// 			flex: 4,
			// 			child: childWidget("")
			// 		),

			// 		Expanded (
			// 			flex: 3,
			// 			child: childWidget("")
			// 		),

			// 		Expanded (
			// 			flex: 1,
			// 			child: childWidget("")
			// 		),
			// 	],
			// ),

			// Expanded with FlexFit ppty
			body: Row (
				children: [
					Flexible (
						fit: FlexFit.tight,
						flex: 4,
						child: childWidget("4/8")
					),

					Flexible (
						fit: FlexFit.tight,
						flex: 3,
						child: childWidget("3/8")
					),

					Flexible (
						fit: FlexFit.tight,
						flex: 1,
						child: childWidget("1/8")
					),
				]
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