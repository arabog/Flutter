import 'package:flutter/material.dart';
// import 'project_structure/main_0.dart';
// import 'package:flutter_app1/flutter_stru5/flutter_app_structure.dart';
// import 'flutter_widget6/flutter_widget.dart';

// import 'flutter_widget6/future_builder_widget.dart';

// import 'flutter_widget6/placeholder_widget.dart';

// import 'flutter_widget6/stream_builder.dart';

// import 'flutter_widget6/alert_dialog.dart';

// import 'buliding_layouts7/buliding_layouts.dart';

// import 'buliding_layouts7/project/int_page.dart';

// import 'responsive_interfaces8/responsive_interfaces.dart';

// import 'user_interface9/user_interface.dart';

// import 'flutter_themes10/flutter_themes.dart';

// import 'persisting_data11/persisting_data.dart';

import 'persisting_data11/moor/persist_theme_db.dart';


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

			// home: StreamBuilderDemo()
			// home: AlertDialogDemo()
			// home: LayoutApp()
			// home: ScrollApp(),

			// home: FittedBoxApp(),

			// home: ExpandedApp(),

			// home: BookApp(),
			// home: FlutterThemeApp(),

			// home: PersistingDataApp(),

			home: MoorBooksApp(),
		);
	}
}


