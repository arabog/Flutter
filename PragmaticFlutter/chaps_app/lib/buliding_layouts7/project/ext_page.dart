import 'package:flutter/material.dart';


class HorizontalScroll extends StatelessWidget {
	const HorizontalScroll({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(

			body: Container(

				child: Row(
					// scrollDirection: Axis.horizontal,

					children: [
						childWidget(0),
						childWidget(1),
						childWidget(2),
					],
				),
				
			),
		);
	}
}



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
