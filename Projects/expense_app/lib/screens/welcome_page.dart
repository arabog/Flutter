import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WelcomePage extends StatelessWidget {
	
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(

				body: Padding(
					padding: const EdgeInsets.all(16.0),

					child: Center (

							child: Container (

								child: Center(
									child: Column(
										mainAxisAlignment: MainAxisAlignment.center,

										children: <Widget> [
											// SizedBox(
												// for image
											// ),

											const SizedBox(
												height: 16,
											),

											Text("Hayster's Laundromat"),

											const SizedBox(
												height: 16,
											),

											const SizedBox(
												height: 16,
											),


											childWidget(context),

											const SizedBox(
												height: 16,
											),

											buildButton(context),

											const SizedBox(
												height: 16,
											),

											TextButton(
												style: ButtonStyle(
													foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
												),
												
												onPressed: () { },
												child: Text('TextButton'),
											),

										],
									),
								)
							)
						// ),
					
					)
				),
			),
		);
	}


	Widget buildButton(BuildContext context) {
		return SizedBox(
			height: 40,
			width: 300,

			child: MaterialButton(
				color: Colors.blue,
				shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),

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

	Widget childWidget(BuildContext context) {
		return Container (
			color: Colors.red,
			width: 300,
			height: 150,

			padding: const EdgeInsets.all(10.0),

			child: Center(

				child: Text(
					"Get ready to make your life easy with single click away which makes laundry service much easier",				
					style: TextStyle(fontSize: 20, color: Colors.white),
					
					textAlign: TextAlign.center,
					
				),

			),
		);
	}
}



