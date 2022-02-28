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
	final List<String> greetings = [
		"Hello Books",
		'Hola Libros',
		'Ciao Libri',
		'हैलो िकताबें ',
	];

	int index = 0;
	String? current;

	void _updateGreeting() {
		setState(() {
			current = greetings[index];

			index = index == (greetings.length - 1) ? 0 : index + 1;
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold (
			appBar: AppBar(
				title: Center(
					child: Text(widget.title),
				)
			),

			body: Center (
				child: Text(
					greetings[index],

					style: Theme.of(context).textTheme.headline4,
				),
			),

			floatingActionButton: FloatingActionButton(
				onPressed: _updateGreeting,

				tooltip: 'Greeting',

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



cont on pg 108
*/ 