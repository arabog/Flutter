/*
THE BooksApp ANATOMY:


*/ 

import 'package:flutter/material.dart';

class ExpandedApp extends StatelessWidget {
	@override 
	Widget build(BuildContext context) {

		return MaterialApp(
			home: HelloBooksApp(),
		);
	}
}


class HelloBooksApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,

			home: Scaffold(
				appBar: AppBar(
					title: Text('Hello Books'),
				),

				body: Center(
					child: Text(
						'Hello Books',
						style: Theme.of(context).textTheme.headline4,
					),
				),

				floatingActionButton: FloatingActionButton(
					onPressed: () {},

					tooltip: 'Greeting',
					
					child: Icon(Icons.insert_emoticon),
				),
			),
		);
	}
}