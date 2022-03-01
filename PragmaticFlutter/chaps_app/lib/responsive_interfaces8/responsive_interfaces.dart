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


The `FlexFit.loose` Property
The `FlexFit.loose` will keep the default Flexible behavior and 
let them take their maximum sizes. In the code snippet below, 
the three children to Row widget are assigned four, three, and 
one out of eight parts, respectively, as above. When the `fit` 
property is set to `FlexFit.loose`, they only take the space 
assigned to each of them but don’t take up the remaining space 
available horizontally.

body: Row (
	children: [
		Flexible (
			fit: FlexFit.loose,
			flex: 4,
			child: childWidget("4/8")
		),

		Flexible (
			fit: FlexFit.loose,
			flex: 3,
			child: childWidget("3/8")
		),

		Flexible (
			fit: FlexFit.loose,
			flex: 1,
			child: childWidget("1/8")
		),
	]
)

FractionallySizedBox WIDGET
The FractionallySizedBox (FractionallySizedBox class) is a single-child
layout widget. It sizes its child to a fraction of the total available space. 
It’s properties `widthFactor` and `heightFactor` provide the fraction of 
the screen that the widget can claim. The `alignment` property positions 
its child widget. This widget without a child can be used as a placeholder. 

It’s recommended to wrap FractionallySizedBox in a Flexible widget 
when adding a child to the Row and Column widget.

In the following example, a Container widget is placed in the center of the
screen using the Center widget. A FractionallySizedBox is wrapped in
a Padding widget to keep it visually distinguishable. The ElevatedButton
(ElevatedButton class) widget is added as the child to the 
FractionallySizedBox.
The FractionallySizedBox helps to control the width and height of the
ElevatedButton widget as well as its position inside the Container widget
using the `alignment` property. In this case, the FractionallySizedBox is
aligned to the bottom center to the Container widget.

body: Center (
	child: Container(
		width: 200,
		height: 200,

		decoration: BoxDecoration(
			border: Border.all(),
		),

		child: Padding (
			padding: const EdgeInsets.all(8.0),

			child: FractionallySizedBox (
				alignment: Alignment.bottomCenter,

				widthFactor: 0.8,
				heightFactor: 0.2,

				child: ElevatedButton (
					child: Text (
						"Tap",

						style: TextStyle(fontSize: 20),
					),

					onPressed: () {}
				),
			),
		),
	),
)


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
			body: FittedBox(
				child: Row(

					children: [
						Image.asset("assets/images/image_pic.png"),

						Image.asset("assets/images/image_pic.png"),
					],
				),

			),

			// Expanded
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

			// Expanded with flex ppty
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
			),

			// Expanded with FlexFit.tight ppty
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


			// Expanded with FlexFit.loose ppty
			body: Row (
				children: [
					Flexible (
						fit: FlexFit.loose,
						flex: 4,
						child: childWidget("4/8")
					),

					Flexible (
						fit: FlexFit.loose,
						flex: 3,
						child: childWidget("3/8")
					),

					Flexible (
						fit: FlexFit.loose,
						flex: 1,
						child: childWidget("1/8")
					),
				]
			)

			// FractionallySizedBox widget
			body: Center (
				child: Container(
					width: 200,
					height: 200,

					decoration: BoxDecoration(
						border: Border.all(),
					),

					child: Padding (
						padding: const EdgeInsets.all(8.0),

						child: FractionallySizedBox (
							alignment: Alignment.bottomCenter,

							widthFactor: 0.8,
							heightFactor: 0.2,

							child: ElevatedButton (
								child: Text (
									"Tap",

									style: TextStyle(fontSize: 20),
								),

								onPressed: () {}
							),
						),
					),
				),
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


LayoutBuilder WIDGET
The LayoutBuilder (LayoutBuilder class) widget supports the multi-child 
layout. It builds widgets dynamically as per the constraint passed by the 
parent. The LayoutBuilder layout widget works well when creating 
responsive layouts. It can build appropriate layouts based on the constraints’ 
maximum width (maxWidth) or maximum height (maxHeight). The 
LayoutBuilder calls the builder function at the layout time.

In this example, LayoutBuilder renders different widgets based on the 
maximum width of the screen during layout time. It renders `largeScreen()` 
layout for screens larger than 400 dips whereas `smallScreen()` for any 
screen with width less than 400 dips.

body: LayoutBuilder (
	builder: (context, constraints) {
		if(constraints.maxWidth > 400) {
			return largeScreen();
		} else {
			return smallScreen();
		}
	}
)

// Show containers in Column
Widget smallScreen() {
	return Column(
		children: [
			Container(
				padding: const EdgeInsets.all(8.0),

				width: 250,
				height: 250,

				child: Image.asset(
					"assets/images/image_pic.png"),

					fit: BoxFit.cover,
				),
			),

			Container(
				padding: const EdgeInsets.all(8.0),

				width: 250,
				height: 250,

				child: Image.asset(
					"assets/images/image_pic.png"),
					fit: BoxFit.cover,
				),
			),
		],
	);
}


  /// Show containers in Row
Widget largeScreen() {
	return Row(
		children: [
			Container(
				padding: const EdgeInsets.all(8.0),

				width: 250,
				height: 250,

				child: Image.asset(
					"assets/images/image_pic.png"),
					fit: BoxFit.cover,
				),
			),

			Container(
				padding: const EdgeInsets.all(8.0),

				width: 250,
				height: 250,

				child: Image.asset(
					"assets/images/image_pic.png"),
					fit: BoxFit.cover,
				),
			),
		],
	);
}


// complete code
class ExpandedApp extends StatelessWidget {
	@override 
	Widget build(BuildContext context) {

		return MaterialApp(
			home: LayoutBuilderApp(),
		);
	}
}


class LayoutBuilderApp extends StatefulWidget {
	// LayoutBuilderApp({Key key}) : super(key: key);

	@override

	_LayoutBuilderAppState createState() => _LayoutBuilderAppState();
}


class _LayoutBuilderAppState extends State<LayoutBuilderApp> {

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("LayoutBuilder Widget"),
			),

			body: LayoutBuilder(
				builder: (context, constraints) {
					if(constraints.maxWidth > 400) {
						return largeScreen();
					} else {
						return smallScreen();
					}
				}
			),
		
		);
	}


	// Show containers in Column
	Widget smallScreen() {
		return Column(
			children: [
				Container(
					padding: const EdgeInsets.all(8.0),

					width: 250,
					height: 250,

					child: Image.asset(
						"assets/images/image_pic.png",

						fit: BoxFit.cover,
					),
				),

				Container(
					padding: const EdgeInsets.all(8.0),

					width: 250,
					height: 250,

					child: Image.asset(
						"assets/images/image_pic.png",

						fit: BoxFit.cover,
					),
				),
			],
		);
	}


	/// Show containers in Row
	Widget largeScreen() {
		return Row(
			children: [
				Container(
					padding: const EdgeInsets.all(8.0),

					width: 250,
					height: 250,

					child: Image.asset(
						"assets/images/image_pic.png",

						fit: BoxFit.cover,
					),
				),

				Container(
					padding: const EdgeInsets.all(8.0),

					width: 250,
					height: 250,

					child: Image.asset(
						"assets/images/image_pic.png",

						fit: BoxFit.cover,
					),
				),
			],
		);
	}

}

Wrap WIDGET
The Wrap (Wrap class) widget is a layout widget and supports the multi-child 
layout. This widget is helpful when Row and Column widgets run out of the 
room. It puts the overflowing widget in the cross-axis when it runs out of space 
in the placement line along the main-axis. The `direction` property is used to align
its children widgets either in the horizontal or vertical direction. The `spacing`
property specifies the gap between the children in the same axis. The `
runSpacing` property specifies the gap between the runs.

In the following example, the Wrap widget is wrapped in the Center widget.
There are six children widgets assigned to the Wrap widget. The child widgets 
are aligned in the horizontal direction using `direction: Axis.horizontal`.

There’s a gap of 20 dips in between the children’s widgets horizontally. 
Whenever a number of children overflow the space available in the main 
axis, the remaining children widgets run in the next line where they’re 
aligned horizontally (or in the next column when aligned vertically). 
The `runSpacing` property provides the gap between these runs.

body: Wrap (
	direction: Axis.horizontal,

	spacing: 20.0,

	runSpacing: 40.0,

	children: [
		childWidget("1"),
		childWidget("2"),
		childWidget("3"),
		childWidget("4"),
		childWidget("5"),
		childWidget("6"),
	],
)


Widget childWidget(String text) {
	return CircleAvatar(
		radius: 40,
		backgroundColor: Colors.grey,

		child: Text(
			text,
			style: TextStyle(fontSize: 20),
		),
	);
}


CONCLUSION
I encourage you to check out the Flutter widget catalog 
(Widget Catalog) to learn more about the layout widgets.

The following concluding points are the general recommendations for 
building interfaces in Flutter.
• If you know the direction of laying out the widgets, then use 
Row or Column.
• If you don’t know the main axis direction for widgets, then use the Flex
widget.
• If you have only one child to display, then use Center or Align to 
position the child.
• If a child should be smaller than the parent, then wrap it in the Align
(Align class) widget.
• If a child is going to be bigger than the parent, then wrap it in a
SingleChildScrollView (SingleChildScrollView class) or Overflow
(OverflowBox class) widget.

*/ 

import 'package:flutter/material.dart';

class ExpandedApp extends StatelessWidget {
	@override 
	Widget build(BuildContext context) {

		return MaterialApp(
			home: WrapWidgetApp(),
		);
	}
}


class WrapWidgetApp extends StatefulWidget {
	// WrapWidgetApp({Key key}) : super(key: key);

	@override

	_WrapWidgetAppState createState() => _WrapWidgetAppState();
}


class _WrapWidgetAppState extends State<WrapWidgetApp> {

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("WrapWidget Widget"),
			),


			body: Wrap (
				direction: Axis.horizontal,

				spacing: 20.0,

				runSpacing: 40.0,

				children: [
					childWidget("1"),
					childWidget("2"),
					childWidget("3"),
					childWidget("4"),
					childWidget("5"),
					childWidget("6"),
				],
			)

		
		);
	}


	Widget childWidget(String text) {
		return CircleAvatar(
			radius: 40,
			backgroundColor: Colors.grey,

			child: Text(
				text,
				style: TextStyle(fontSize: 20),
			),
		);
	}

}








// cont from pg 152