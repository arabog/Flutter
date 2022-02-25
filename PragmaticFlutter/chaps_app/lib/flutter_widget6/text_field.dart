/*
TextField WIDGET
The TextField (TextField class) widget lets the user enter the text using 
hardware or an on-screen keyboard. 
The TextEditingController (TextEditingController class) manages the 
widget by allowing users enter text, submitting, and finally clearing 
the text. We will be using a StatefulWidget for this example

` _ MyTextFieldWidgetState` holds the state of this widget. It has a 
reference to the TextEditingController as ` _ controller`. The `userText` 
variable contains the text entered in the `TextField` widget.

This controller needs to be initialized inside the `initState()` method. Remember
to remove the controller in the `dispose()` method to avoid memory leaks.

*/ 

import 'package:flutter/material.dart';

void main() => runApp(TextFieldDemo());


class TextFieldDemo extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,

			home: MyTextFieldWidget(),
		);
	}

}


class MyTextFieldWidget extends StatefulWidget {
	MyTextFieldWidget({Key key}) : super(key: key);

	@override
	_MyTextFieldWidgetState createState() => _MyTextFieldWidgetState();
}


class _MyTextFieldWidgetState extends State<MyTextFieldWidget> {
	
	TextEditingController _controller;

	String userText = "";

	void initState() {
		super.initState();

		_controller = TextEditingController();
	}

	void dispose() {
		_controller.dispose();

		super.dispose();
	}


	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Center(
					child: Text("TextField Widget"),
				),
			),


			body: Padding(
				padding: const EdgeInsets.all(20.0),

				child: Column(
					children: [
						TextField(
							autofocus: true,

							controller: _controller,
							
							onSubmitted: (String value) {
								setState(() {
									userText= value;

									_controller.clear();
								});
							}
						),

						SizedBox(
							height: 20,
						),


						Text("User entered $userText"),
					]
				),
			)
		);
	}
}