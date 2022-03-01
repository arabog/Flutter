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

*/ 

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

			body: Row(

				children: [
					Image.asset("assets/images/image_pic.png"),

					Image.asset("assets/images/image_pic.png"),
				],
				
			),
		);
	}
}