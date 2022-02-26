import 'package:flutter/material.dart';
// import 'project_structure/main_0.dart';
// import 'package:flutter_app1/flutter_stru5/flutter_app_structure.dart';
// import 'flutter_widget6/flutter_widget.dart';

// import 'flutter_widget6/future_builder_widget.dart';

// import 'flutter_widget6/placeholder_widget.dart';


import 'flutter_widget6/stream_builder.dart';

void main() {
	runApp(const MyApp());
}


class MyApp extends StatelessWidget {
	const MyApp({Key key}) : super(key: key);

	// This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Demo',

			theme: ThemeData(
				primarySwatch: Colors.blue,
			),

			// home: const MyHomePage(title: 'Flutter Demo Home Page'),
			
			// home: MyAppBook(),
			// home: HelloBooksApp()
			// home: ImageApp()

      // home: FutureBuilderDemo(),

      // home: PlaceholderDemo(),

      home: StreamBuilderDemo()
		);
	}
}


