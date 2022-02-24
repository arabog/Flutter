import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginPage extends StatelessWidget {
	
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

											buildTextfield("Username", false),

											const SizedBox(
												height:20,
											),

											buildTextfield("Password",  true),

											const SizedBox(
												height:20,
											),

											buildButton(context),

											const SizedBox(
												height:20,
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
					"Login",
					style: TextStyle(color: Colors.white),
				),

				onPressed: () async{
					// 
				}
			)
		);
	}

	  Widget buildTextfield(String hintText, bool obscureText) {
		return SizedBox(
			height: 40,
			width: 300,
		  
		 	child: TextField(
				 obscureText: obscureText,
				 
			
				// cursorColor: rwColor,
				decoration: InputDecoration(
					border: const OutlineInputBorder(
						borderSide: BorderSide(
							color: Colors.green,
							width: 1.0,
						),
					),

					focusedBorder: const OutlineInputBorder(
						borderSide: BorderSide(
							color: Colors.green,
						),
					),

				
					hintText: (hintText),
					hintStyle: const TextStyle(height: 0.5),

					
				),
			)
		);
	}


}



