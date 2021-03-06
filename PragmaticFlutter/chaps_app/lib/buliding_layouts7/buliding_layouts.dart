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
Flutter app using the Center widget. In the rest of the chapter, you???ll 
explore other layout widgets which are helpful in arranging widgets 
as per the app???s design needs


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


SINGLE CHILD WIDGET:
Container WIDGET
The Container (Container class) widget is a simple and versatile layout 
widget. It can hold only one child as its descendant. It has versatile 
properties that can be leveraged to style its child widget to change the 
background color or shape and size. By default, it aligns itself to the 
top-left corner of the screen.

Let???s add a Text widget with ???Hello Container??? text as its child. The 
TextStyle(Flutter Team, 2020) is applied to make the text???s font ???30???.

Container(
	child: Text(
		"Hello Container",
		style: TextStyle(fontSize: 30),
	),
),

You wouldn???t notice any difference right after adding a widget as a 
child unless you use parameters/properties like color, padding, etc. 
Let???s check out some of the Container widget???s properties next


Color Property
The Container layout widget???s color property (color property) is 
used to highlight the background of the widget,

Container(
	color: Colors.red,

	child: Text(
		"Hello Container",
		style: TextStyle(fontSize: 30),
	),
),

Padding Property
The padding property (padding property) adds empty space between 
the child widget and the Container (Container class) widget???s boundary, 
The EdgeInsetsGeometry (EdgeInsetsGeometry class) is used to
provide the padding of ???16??? points from all four sides.

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
widget???s width and height, which can be constrained using the width 
and height property of the Container widget or using the BoxConstraints 
(BoxConstraints class). The widget expands to fill the parent???s size.

Container(
	alignment: Alignment.center,

	child: Text(
		"Hello Container",
		style: TextStyle(fontSize: 30),
	),
),

Constraints Property
The `constraints` property applies the size constraints to the Container 
widget. For example, BoxConstraints.tightFor(width:x, height:y) creates 
a box for the given width ???x???, and/or height ???y???.

Container(
	constraints: BoxConstraints.tightFor(width: 100.0, height:100.0),

	child: Text(
		"Hello Container",
		style: TextStyle(fontSize: 30),
	),
),

Transform Property
The `transform` property (transform property) is used to transform 
the child before adding to the layout widget `Container`. The value 
`Matrix4.rotationZ(0.3)` rotates the Container widget clockwise by 
the given amount.

Container(
	transform: Matrix4.rotationZ(0.3),

	child: Text(
		"Hello Container",
		style: TextStyle(fontSize: 30),
	),
),

Decoration Property
The `decoration` property is used to add shape to the Container widget. 
It uses BoxDecoration to provide details. The BoxDecoration (BoxDecoration
class) tells the widget how the box around the Container widget will be painted.
In simple words, this property lets Container create a border around it or drop 
a shadow. Please note that the Container widget???s `color` property cannot be 
used along with `decoration`. The Container widget???s `color` and `decoration`
property can???t be used together.

Container(
	decoration: BoxDecoration(
		border: Border.all(
			color: Colors.amber,
			width: 5.0,
			style: BorderStyle.solid,
		),
	),

	child: Text(
		"Hello Container",
		style: TextStyle(fontSize: 30),
	),
),

Padding WIDGET
The Padding (Padding class) widget insets its child as per the given padding. 
It creates empty space around the child. It takes care of resizing any constraints 
passed to the child to be able to provide the given empty space around it. It uses 
the `padding` property to assign the amount of space for the inset. The 
EdgeInsets (EdgeInsets class) class specifies the offset from all four edges. In the 
example below, an offset of 8 dip(Density-independent Pixels) is provided from 
the top, bottom, left, and right sides. The keyword `const` is required when you 
are sure that the provided padding won???t change.

double padding = 8.0;
Padding(
	padding: EdgeInsets.all(padding),

	child: Text(
		"Hello Padding",
		style: TextStyle(fontSize: 30),
	),
)

The difference between `padding` and `margin` is that Padding creates the
empty space around the child widget of the layout widget like Container. 
The`margin` property creates the space around the layout widget itself.

ConstrainedBox WIDGET
Sometimes you may want to render a widget of a given size. The 
ConstrainedBox (ConstrainedBox class) is a layout widget that puts 
additional constraints on its child.
Let???s check out three types of `BoxContraints` applied to the ConstrainedBox
widget. It specifies a maximum and minimum width and height its child is 
allowed to expand. `BoxConstraints.expand()` fills the parent.

Minimum Width & Height
This constraint imposes minimum width and height on the child. In this 
example, a ConstrainedBox widget is added in the center of the body of 
the app. A Container widget is added as the child displaying a message 
in the Text widget.

body: Center(
	child: ConstrainedBox(
		constraints: BoxConstraints(
			minWidth: 100,
			minHeight: 100,
		),

		child: Container(
			color: Colors.grey,
			child: Text(message),
		),
	),
),

BoxConstraints.expand()
The `BoxConstraints.expand()` let its child expand to the given 
width and height.

body: Center(
	child: ConstrainedBox(
		constraints: BoxConstraints.expand(
			width: 200,
			height: 200,
		),

		child: Container(
			color: Colors.grey,
			child: Text(message),
		),
	),
),

BoxConstraints.loose()
The `BoxConstraints.loose()` constrains its child to the given size. It can???t go
beyond the provided size.

body: Center(
	child: ConstrainedBox(
		constraints: BoxConstraints.loose(
			Size(100, 200),
		),

		child: Container(
			color: Colors.grey,
			child: Text(message),
		),
	),
),

SizedBox WIDGET
The SizedBox (SizedBox class) widget is a Single-child layout widget. It???s a box
widget of a specific size and can add one another widget as its child. It???s useful 
when you know the size of the widget. The `width` property is used to set the 
width of the box, and the `height` property is used to set the box???s height.

SizedBox(
	height: 200,
	width: 200,

	child: Container(
		color: Colors.deepPurpleAccent,
	),
)

There???s a convenience constructor, `SizedBox.expand` (SizedBox.expand
constructor), that can also be used to create a box that takes the width 
and height of its parent.
```
SizedBox.expand(
	child: Container(
		color: Colors.deepPurpleAccent,
	),
)


The same results can be attained by assigning the SizedBox widget???s 
`width` and `height` properties to `double.infinity`.
SizedBox(
	height: double.infinity,
	width: double.infinity,

	child: Container(
		color: Colors.deepPurpleAccent,
	),
)


It is common to use a `SizedBox` without a child to add space between 
widgets when building interfaces.




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
	// double padding = 8.0;
	double padding = 88.0;
	// double padding = 104.0;

	final message = "Contrained Box Contrained Box Contrained Box";

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

			// Container widget
			// body: Container(
			// 	decoration: BoxDecoration(
			// 		border: Border.all(
			// 			color: Colors.amber,

			// 			width: 5.0,

			// 			style: BorderStyle.solid,
			// 		),
			// 	),
			// 	// color: Colors.red,

			// 	// padding: const EdgeInsets.all(16.0),

			// 	// margin: const EdgeInsets.all(20.0),

			// 	// alignment: Alignment.center,

			// 	constraints: BoxConstraints.tightFor(width: 300, height: 100),
				
			// 	// transform: Matrix4.rotationZ(0.3),

			// 	child: Text (
			// 		"Hello Container",

			// 		style: TextStyle(fontSize: 30),
			// 	),

				
			// ),

			// Padding widget: Padding(with capital P) can't be used with with Container
			// body: Padding(
			// 	padding: EdgeInsets.all(padding),

			// 	child: Text (
			// 		"Hello Padding",

			// 		style: TextStyle(fontSize: 30),
			// 	),
			// ),

			// ContrainedBox Widget
			// body: Center(
			// 	child: ConstrainedBox(
			// 		constraints: BoxConstraints.expand (
			// 			width: 200,
			// 			height: 200,
			// 		),

			// 		child: Container(
			// 			color: Colors.grey,

			// 			child: Text(message),
			// 		),
			// 	),
			// ),


			// BoxConstraints.loose
			// body: Center(
			// 	child: ConstrainedBox(
			// 		constraints: BoxConstraints.loose(
			// 			Size(100, 200),
			// 		),

			// 		child: Container(
			// 			color: Colors.grey,
			// 			child: Text(message),
			// 		),
			// 	),
			// ),

			// SizedBox
			// body: SizedBox.expand (
			body: SizedBox (
				height: double.infinity,
				width: double.infinity,

				child: Container(
					color: Colors.deepPurpleAccent,
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


*/ 




/*
MULTI CHILD WIDGET:
Row WIDGET
The Row (Row class) widget is used to arrange its children in a horizontal 
fashion. Let???s add three Container widgets as children. 
The `childWidget(int index)` method returns a Container widget of width 
and height device-independent pixels or dips (devicePixelRatio property). 
The container has a Text widget as its child, which displays the number 
passed to the method as a parameter.

body: Row(
	children: [
		childWidget(0),
		childWidget(1),
		childWidget(2),
	],
),


Widget childWidget(int index) {
	return Container(
		color: getColor(index),

		width: 100,
		height: 100,

		child: Center(
			child: Text(
				"$index",
				style: TextStyle(fontSize: 40),
			),
		),
	);
}

Now that we have got a child, let???s add this three times in the Row 
widget as below:
```
Row(
	children: [
		childWidget(0),
		childWidget(1),
		childWidget(2),
		childWidget(3),
	],
),

Let???s try to add one more widget, `childWidget(3)` to Row widget???s 
children and observe the change.

You???ll notice that there???s not enough space for all four widgets to fit 
horizontally. The last child renders with yellow and black lines. 
You will see those lines whenever a widget overflows the available 
space to render itself.

IntrinsicHeight WIDGET
The IntrinsicHeight (IntrinsicHeight class) widget is a Single-child layout
widget. IntrinsicHeight widget helps to set the height of its child widget 
when there???s unlimited height available to it. This class is expensive. 
The cheap way of limiting the widget size is to use the SizedBox (SizedBox 
class) layout widget. 
This widget is used when children of a Row (Row class) widget are 
expected to expand to the height of the tallest child.
First, create children of varying sizes with the help of the following 
`childWidget(int index)` method:

Widget childWidget(int index) {
	return Container(
		color: getColor(index),

		width: 100 + index * 20.toDouble(),
		height: 100 + index * 30.toDouble(),

		child: Center(
			child: Text(
				"$index",
				style: TextStyle(fontSize: 40),
			),
		),
	);
}

The code above will render the three Container widgets of varying 
sizes in a horizontal array

The goal is to stretch all the children to the same height. So, let???s set 
the Row widget???s `crossAxisAlignment` property to `
CrossAxisAlignment.stretch` to make all children equally tall.

body: Row(
	crossAxisAlignment: CrossAxisAlignment.stretch,

	children: [
		childWidget(0),
		childWidget(1),
		childWidget(2),
		childWidget(3),

	],
),

However, the problem is that they???ll take up all the available space vertically

We want to make all the children as tall as the tallest child widget while not
taking up all the available vertical space. This is where IntrinsicHeight
(IntrinsicHeight class) widget comes to play. All you need to do is to wrap the Row
widget inside IntrinsicHeight

IntrinsicHeight(
	child: Row(
		crossAxisAlignment: CrossAxisAlignment.stretch,

		children: [
			childWidget(0),
			childWidget(1),
			childWidget(2),
		],
	),
),

The IntrinsicHeight widget expands all of the Row widget???s children to the
same height as the tallest child widget


Column WIDGET
The Column (Column class) widget is used to arrange its children in a 
vertical manner. Let???s add three Container widgets as children similar
to the Row widget. The `childWidget(int index)` method returns a 
Container widget of width and height as 200 dips. The container 
has a Text widget as its child, which displays the number passed 
to the method as a parameter.

body: Column(
	children: [
		childWidget(0),
		childWidget(1),
		childWidget(2),
	],
),


Widget childWidget(int index) {
	return Container(
		color: getColor(index),

		width: 200,
		height: 200,

		child: Center(
			child: Text(
				"$index",
				style: TextStyle(fontSize: 40),
			),
		),
	);
}	

You???ll notice the same yellow and black overflow lines that you observed 
earlier in the Row widget. This is because there???s not enough space for 
all four widgets to fit vertically

IntrinsicWidth WIDGET
The IntrinsicWidth (IntrinsicWidth class) widget is a Single-child layout 
widget. This widget is useful to limit the width of the child widget to a given 
width; otherwise, it???ll expand to the maximum width available to it. This 
widget is usually used when each child of a Column widget is expected to 
have the same width. All children expand to the width of the widest child 
widget of the Column widget.

body: Column(
	children: [
		childWidget(0),
		childWidget(1),
		childWidget(2),
	],
),

Widget childWidget(int index) {
	return Container(
		color: getColor(index),

		width: 100 + index * 20.toDouble(),
		height: 100 + index * 30.toDouble(),

		child: Center(
			child: Text(
				"$index",
				style: TextStyle(fontSize: 40),
			),
		),
	);
}

The three children with different sizes will be shown in Column widget

We can set the `crossAxisAlignment` property to `CrossAxisAlignment.
stretch` to make all Container children of the same widths.


body: Column(
	crossAxisAlignment: CrossAxisAlignment.stretch,

	children: [
		childWidget(0),
		childWidget(1),
		childWidget(2),
	],
),

Again, the problem with this approach is that it takes up all the cross-axis 
horizontal space

The IntrinsicWidth widget can help solve this issue by wrapping the 
Column widget as its child. It expands all of the Column widget???s 
children to the same width as the widest child widget.

IntrinsicWidth(
	child: Column(
		crossAxisAlignment: CrossAxisAlignment.stretch,

		children: [
			childWidget(0),
			childWidget(1),
			childWidget(2),
		],
	),
),


ListView WIDGET
The ListView (ListView class) widget is a Multi-child and scrolling widget. 
It makes its children scroll in the main axis while filling the space in the 
cross-axis. Let???s add four children to the ListView widget

body: ListView(
	children: [
		childWidget(0),
		childWidget(1),
		childWidget(2),
		childWidget(3),
	],
),


GridView WIDGET
The GridView (GridView class) widget is a Multi-child and scrolling 
widget like ListView. It arranges its children in a two-dimensional array. 
In this section, we will focus on creating a grid layout using GridView.count 
(GridView.count constructor) constructor. It creates a grid with a given number 
of tiles on the cross-axis. The direction a GridView scroll is the main-axis. 
The `crossAxisCount` property is used for the number of tiles arranged in the 
cross-axis. In the following code snippet, `crossAxisCount` is two, which 
means there are two tiles in the horizontal direction.

body: GridView.count(
	crossAxisCount: 2,

	children: [
		childWidget(0),
		childWidget(1),
		childWidget(2),
		childWidget(3),
	],
),

Table WIDGET
The Table (Table class) layout widget supports multiple children. This 
layout widget arranges its children in a tabular layout. This layout 
doesn???t scroll and is used for a fixed number of widgets. 

The Table layout widget is useful to design interfaces that don???t require 
any scrolling and to avoid multiple levels of nested Row and Column 
widgets. 
The Table widget can be wrapped inside a SingleChildScrollView 
(SingleChildScrollView class) to make it scrollable. The 
SingleChildScrollView  widget is like a scrollable box, which makes 
its only child scrollable.
Let???s add four children to the Table layout. Each child is a Container 
widget of different sizes and colors.

Widget childWidget(int index) {
	return Container(
		color: getColor(index)
		width: 200 + index * 20.toDouble(),
		height: 200 + index * 30.toDouble(),

		child: Center(
			child: Text(
				"$index",
				style: TextStyle(fontSize: 40),
			),
		),
	);
}

The Table widget has multiple children of type TableRow widget, as 
shown in the code snippet below. The `border` property is used to 
border each cell. The `columnWidths` property is used to assign 
the width for the given column. It???s a mapping between the column 
number to FractionColumnWidth (FractionColumnWidth class) for 
the given column.

body: Table(
	border: TableBorder.all(width: 2.0),

	columnWidths: {
		0: FractionColumnWidth(.5),
		1: FractionColumnWidth(.5),
	},

	children: [
		TableRow(
			children: [
				childWidget(0),
				childWidget(1),
			],
		),

		TableRow(
			children: [
				childWidget(2),
				childWidget(3),
			],
		),
	],
)

Stack WIDGET
The Stack (Stack class) widget is a Multi-child layout widget since it 
can hold multiple children. It can stack one widget on top of another 
widget, just as its name says. This widget is useful when one widget 
is required to be overlapped by another.

Widget childWidget(int index) {
	return Container(
		color: getColor(index)
		width: 200 + index * 20.toDouble(),
		height: 200 + index * 30.toDouble(),

		child: Center(
			child: Text(
				"$index",
				style: TextStyle(fontSize: 40),
			),
		),
	);
}

Next, put three `childWidgets()` in the Stack widget as below:

body: Stack (
	children: [
		childWidget(2),
		childWidget(1),
		childWidget(0),
	],
),

The `childWidget(2)` is the Container widget with the biggest width and
height, and it???s purple in color. This widget goes first. The next child widget,
`childWidget(1)`, is green and slightly smaller than the purple widget. It is
placed on top of the purple widget. The third widget, `childWidget(0)`, is red
and smallest. It???s placed on top of the stack.


import 'package:flutter/material.dart';

class LayoutApp extends StatelessWidget {
	@override 
	Widget build(BuildContext context) {

		return MaterialApp(
			home: MyHomePage(title: 'Hello Books'),
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

				title: Center(
					child: Text('Hello Books'),
				),
			),

			// body: Center(
			// 	child: Row(
			// 		children: [
			// 			childWidget(0),
			// 			childWidget(1),
			// 			childWidget(2),
			// 		],
			// 	),

				
			// ),

			// body: IntrinsicHeight(
			// 	child: Row(
			// 		crossAxisAlignment: CrossAxisAlignment.stretch,

			// 		children: [
			// 			childWidget(0),
			// 			childWidget(1),
			// 			childWidget(2),
			// 			childWidget(3),

			// 		],
			// 	),
			// ),

			// column
			// body: Column(
			// 	crossAxisAlignment: CrossAxisAlignment.stretch,

			// 	children: [
			// 		childWidget(0),
			// 		childWidget(1),
			// 		childWidget(2),
			// 		childWidget(3),
			// 		childWidget(2),
			// 		childWidget(1),
			// 		childWidget(0),
			// 	],
			// ),

			// body: IntrinsicWidth(
			// 	child: Column(
			// 		crossAxisAlignment: CrossAxisAlignment.stretch,

			// 		children: [
			// 			childWidget(0),
			// 			childWidget(1),
			// 			childWidget(2),
			// 			childWidget(3),
			// 			childWidget(2),
			// 			childWidget(1),
			// 			childWidget(0),
			// 		],
			// 	),
			// ),


			// ListView
			// body: ListView(
			// 	children: [
			// 		childWidget(0),
			// 		childWidget(1),
			// 		childWidget(2),
			// 		childWidget(3),
			// 		childWidget(3),
			// 		childWidget(2),
			// 		childWidget(1),
			// 		childWidget(0),
			// 	],
			// ),


			// GridView
			// body: GridView.count(
			// 	// crossAxisCount: 2,
			// 	crossAxisCount: 3,

			// 	children: [
			// 		childWidget(0),
			// 		childWidget(1),
			// 		childWidget(2),
			// 		childWidget(3),
			// 		childWidget(0),
			// 		childWidget(1),
			// 		childWidget(2),
			// 		childWidget(3),
			// 		childWidget(2),
			// 		childWidget(3),
			// 		childWidget(1),
			// 		childWidget(0),
			// 	],
			// ),

			// Table widget
			// body: Padding(
			// 	padding: EdgeInsets.all(12.0),

			// 	child: Table(
			// 		border: TableBorder.all(width: 2.0),

					
			// 		columnWidths: {
			// 			0: FractionColumnWidth(.5),
			// 			1: FractionColumnWidth(.5),
			// 		},

			// 		children: [
			// 			TableRow(
			// 				children: [
			// 					childWidget(0),
			// 					childWidget(1),
			// 				],
			// 			),

			// 			TableRow(
			// 				children: [
			// 					childWidget(2),
			// 					childWidget(3),
			// 				],
			// 			),
			// 		],
			// 	),
			// ),

			// SingleChildScrollView
			// body: SingleChildScrollView(
			// 	padding: EdgeInsets.all(12.0),

			// 	child: Table(
			// 		border: TableBorder.all(width: 2.0),

					
			// 		columnWidths: {
			// 			0: FractionColumnWidth(.5),
			// 			1: FractionColumnWidth(.5),
			// 		},

			// 		children: [
			// 			TableRow(
			// 				children: [
			// 					childWidget(0),
			// 					childWidget(1),
			// 				],
			// 			),

			// 			TableRow(
			// 				children: [
			// 					childWidget(2),
			// 					childWidget(3),
			// 				],
			// 			),

			// 			TableRow(
			// 				children: [
			// 					childWidget(0),
			// 					childWidget(1),
			// 				],
			// 			),

			// 			TableRow(
			// 				children: [
			// 					childWidget(2),
			// 					childWidget(3),
			// 				],
			// 			),

			// 			TableRow(
			// 				children: [
			// 					childWidget(0),
			// 					childWidget(1),
			// 				],
			// 			),

			// 			TableRow(
			// 				children: [
			// 					childWidget(2),
			// 					childWidget(3),
			// 				],
			// 			),
			// 		],
			// 	),
			// ),

			// Stack
			body:  Center(
				child: Stack(
					children: [
						childWidget(2),
						childWidget(1),
						childWidget(0),
					],
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

Widget childWidget(int index) {
	return Container(
		color: getColor(index),

		width: 100,
		height: 100,

		child: Center(
			child: Text(
				"$index",

				style: TextStyle(fontSize: 40),
			),
		),
	);
}

// intrinsicHeight widget
Widget childWidget(int index) {
	return Container(
		color: getColor(index),

		width: 100 + index * 20.toDouble(),
		height: 100 + index * 30.toDouble(),

		child: Center(
			child: Text(
				"$index",
				style: TextStyle(fontSize: 40),
			),
		),
	);
}


Color getColor(int index) {
	Color color = Colors.grey;	//default color

	switch (index) {
		case 0:
			color = Colors.red;

			break;

		case 1:
			color = Colors.green;

			break;

		case 2:
			color = Colors.deepPurple;

			break;
	}

	return color;
}


IndexedStack WIDGET
The IndexedStack (IndexedStack class) widget is a Multi-child layout 
widget as well. It???s like the Stack widget but only shows one child at a 
time. It uses `index` property to switch from one child to another. Let???s 
use the same example we discussed above for the Stack widget. This time 
these three `childWidget()` are wrapped inside IndexedStack instead of 
Stack widget and have an `index` property to show the currently selected 
child. We will wrap IndexedStack inside a GestureDetector 
(GestureDetector class) widget to add a tapping gesture on the widget. 
Each time the widget is tapped, the index changes to the next child and
keeps going one by one

int _childIndex = 0;

@override
Widget build(BuildContext context) {
	return Scaffold(
		body: Center(
			child: IndexedStack(
				index: _childIndex,

				children: [
					childWidget(0),
					childWidget(1),
					childWidget(2),
				],
			),
		),
	);
}

The `childWidget(int index)` method returns a Container widget
wrapped in a GestureDetector method. Tapping on the child widget 
increases the ` _ childIndex` by one. Once it reaches the maximum 
possible index two, the ` _ childIndex` resets itself to zero. The clamp 
(clamp method) method returns the number between zero and two.

Widget childWidget(int index) {
	return GestureDetector(
		onTap: () {
			setState(() {
				index = index == 2 ? 0 : index + 1;

				_childIndex = index.clamp(0, 2);
			});
		},

		child: Container(
			color: getColor(index),

			width: 200 + index * 20.toDouble(),
			height: 200 + index * 30.toDouble(),

			child: Center(
				child: Text(
					"$index",
					style: TextStyle(fontSize: 40),
				),
			),
		),
	);
}

The red widget is stacked at the top, followed by green and purple. 

Ordering of children doesn???t matter in the case of the IndexedStack 
widget. The child widget is displayed based on the selected `index` 
property.???

CONCLUSION:
We discussed Single-child layouts like Container, Padding, ConstrainedBox,
SizedBox, IntrinsicHeight, and IntrinsicWidth. You also learned
about the Multi-child layouts like Row, Column, ListView, GridView, Table,
Stack, and IndexedStack.


import 'package:flutter/material.dart';

class LayoutApp extends StatelessWidget {
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
	int _childIndex = 0;

	@override
	Widget build(BuildContext context) {

		return Scaffold(
			appBar: AppBar(
				title: Text("IndexedStack Widget"),
			),

			body: Center(
				child: IndexedStack(
					index: _childIndex,

					children: [
						childWidget(0),
						childWidget(1),
						childWidget(2),
					],
				),
			),
		);
	}

	// intrinsicHeight widget
	Widget childWidget(int index) {
		final _selectedBox = (() {
			setState( () {
				index = index == 2 ? 0 : index + 1;

				_childIndex = index.clamp(0, 2);
			});
		});

		return GestureDetector(
			// saving d state in a variable
			onTap: _selectedBox,

			// using d state directly
			// onTap: () {
			// 	setState( () {
			// 		index = index == 2 ? 0 : index + 1;

			// 		_childIndex = index.clamp(0, 2);
			// 	});
			// },

			child: Container(
				color: getColor(index),

				width: 200 + index * 20.toDouble(),
				height: 200 + index * 30.toDouble(),

				child: Center(
					child: Text(
						"$index",
						style: TextStyle(fontSize: 40),
					),
				),
			),
		);
	}


	Color getColor(int index) {
		Color color = Colors.grey;	//default color

		switch (index) {
			case 0:
				color = Colors.red;

				break;

			case 1:
				color = Colors.green;

				break;

			case 2:
				color = Colors.deepPurple;

				break;
		}

		return color;
	}

}

*/ 


