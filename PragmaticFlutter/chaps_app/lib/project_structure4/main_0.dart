import 'package:flutter/material.dart';


void main() {
	runApp(MyAppBook());
}

class MyAppBook extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,

			theme: ThemeData(
				primarySwatch: Colors.blue,

				visualDensity: VisualDensity.adaptivePlatformDensity,
			),

			home: MyHomePage(title: 'Hello Books'),
		);
	}
}


class MyHomePage extends StatefulWidget {
	MyHomePage({Key? key, required this.title}) : super(key: key);

	final String title;

	@override
	_MyHomePageState createState() => _MyHomePageState(); 
}

class _MyHomePageState extends State<MyHomePage> {
	final List<String> greetings = [
		'Hello Books',
		'Hola Libros',
		'Ciao Libri',
		'हैलो किताबें',
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
		return Scaffold(
			appBar: AppBar(
				centerTitle: true,
				
				title: Text(widget.title),
			),

			body: Center(
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