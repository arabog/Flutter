import 'package:flutter/material.dart';
import 'ext_page.dart';

class ScrollApp extends StatelessWidget {
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

			body: ListView(
				scrollDirection: Axis.vertical,

				// SizedBox(
				// 	height: 16,
				// ),

				children: [
					Container(
						width: 200,
						height: 400,

						// SingleChildScrollView(

						child: SingleChildScrollView(
							child: Row(
								children: [
									childWidget(2),
									childWidget(1),
									childWidget(0),
									childWidget(3),
									childWidget(2),
									childWidget(1),
									childWidget(0),
								],
							),
						),

						color: Colors.pink,
					),

					childWidget(0),
					childWidget(1),
					childWidget(2),

					childWidget(0),
					childWidget(1),
					childWidget(2),

					childWidget(0),
					childWidget(1),
					childWidget(2),

				],
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
