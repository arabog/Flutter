import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WelcomePage extends StatelessWidget {
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("Hayster's Laundromat")
			),

			body: SafeArea(
				child: Column(
					children: <Widget> [
						SizedBox(
							// for image
						),

						const SizedBox(
							height: 16,
						),

						Text("Hayster's Laundromat"),

						const SizedBox(
							height: 16,
						),

						Text("Get ready to make your life easy with single click away which makes laundry service much easier"),

						const SizedBox(
							height: 16,
						),

						buildButton(context),

					],
				),
			)
		);
	}


	Widget buildButton(BuildContext context) {
		return SizedBox(
			height: 55,

			child: MaterialButton(
				color: Colors.blue,
				shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),

				child: const Text(
					"Get started",
					style: TextStyle(color: Colors.white),
				),

				onPressed: () async{
					// 
				}
			)
		);
	}
}


