import 'package:flutter/material.dart';

class ScrollApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("Horizontal & Vertical ListView"),

				backgroundColor: Colors.green[700],

				centerTitle: true,
			),

			body: Container(
				child: SingleChildScrollView(
					child: Column(
						mainAxisSize: MainAxisSize.min,
						
						children: [

							SizedBox(
								height: 400,

								child: ListView.builder(
									scrollDirection: Axis.horizontal,

									itemCount: 10,
									
									itemBuilder: (context, index) => Container(
										height: 300,
										width: 400,
										
										margin: EdgeInsets.all(10),

										child: Center(
											child: Text(
												"Card $index",
												style: TextStyle(color: Colors.white),
											),
										),
										color: Colors.green[700],
									),
								),
							),


							Flexible(
								child: ListView.builder(
									physics: NeverScrollableScrollPhysics(),

									shrinkWrap: true,

									itemCount: 15,
									itemBuilder: (context, index) => ListTile(
										title: Text("List $index"),
									),
								),
							),

						],
					),
				),
			),
		);
	}
}