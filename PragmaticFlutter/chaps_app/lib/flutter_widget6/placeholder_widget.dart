/*
Placeholder WIDGET
In the previous widget FutureBuilder, a circular progress bar is displayed on
the screen when the app is waiting for data to arrive. When this asynchronous 
data contains information about an image intended to be displayed, it makes 
sense to show a placeholder for this image. The Placeholder (Placeholder 
class) widget does precisely that. It draws a box that indicates that a new 
widget will be added at some point in the future.
*/ 

import 'package:flutter/material.dart';

/// Placeholder widget draws a box that indicates that a new widget will be added at some point in future.
void main() => runApp(PlaceholderDemo());

class PlaceholderDemo extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,

			home: MyPlaceholderWidget(),
		);
	}
}

class MyPlaceholderWidget extends StatefulWidget {
	MyPlaceholderWidget({Key key}) : super(key: key);

	@override
	_MyPlaceholderWidgetState createState() => _MyPlaceholderWidgetState();
}

class _MyPlaceholderWidgetState extends State<MyPlaceholderWidget> {
	Future<String> _futureData = Future<String>.delayed(
		Duration(seconds: 3), () => 'assets/images/image_pic.png');

	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("Placeholder Widget"),
			),

			body: Padding(
				padding: const EdgeInsets.all(20.0),

				child: FutureBuilder<String>(
					future: _futureData,
					
					builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
							Widget futureChild;
							
							if (snapshot.hasData) {
								//success
								futureChild = Image.asset(snapshot.data);
							} else {
								//Placeholder widget while waiting for data to arrive
								futureChild = Container(
									height: 200,
									width: 200,

									child: Placeholder(
										color: Colors.deepPurple,
									),
								);
							}

							return Center(
								child: futureChild,
							);
					},
				),
			),
		);
	}
}