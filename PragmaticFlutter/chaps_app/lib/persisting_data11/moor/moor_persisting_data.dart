/*
Preparing Database Using Moor
First, we’ll use Moor to prepare a database to save `themeId` 
and `themeName`. The active theme’s id will be saved in the 
database table. This table will have only one entry at a given 
time. When the theme switches from light to dark, the older 
entry will be deleted, and a newly selected theme’s id will be 
added to this table. I kept it simple on purpose to demonstrate 
how Moor can be integrated in your app.

The `ThemePrefs` class extends `Table`. ThemePrefs table 
contains only two fields: theme _ id to save id for the theme 
and another field themeName for saving name.

class ThemePrefs extends Table {
	IntColumn get themeId => integer() ();

	TextColumn get themeName => text() ();
}





*/ 





//Persisting selected theme using sharedPreference
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../flutter_themes10/themes.dart';

enum AppThemes { light, dark }

//Showing book listing in ListView
class MoorDataApp extends StatefulWidget {
	@override
	MoorDataAppState createState() => MoorDataAppState();
}

class MoorDataAppState extends State<MoorDataApp> {
	AppThemes currentTheme = AppThemes.light;

	//NEW CODE: Save theme_id using SharedPreference
	Future<void> switchTheme() async {
		currentTheme = currentTheme == AppThemes.light ? AppThemes.dark : AppThemes.light;

		//NEW CODE: save current selection
		var sharedPrefs = await SharedPreferences.getInstance();
		await sharedPrefs.setInt('theme_id', currentTheme.index);
	}

	//NEW CODE: Fetching theme_id from SharedPreference
	void loadActiveTheme(BuildContext context) async {
		var sharedPrefs = await SharedPreferences.getInstance();

		//if theme_id key is null (not found), then set default theme
		int themeId = sharedPrefs.getInt('theme_id') ?? AppThemes.light.index;

		setState(() {
			currentTheme = AppThemes.values[themeId];
		});
	}

	@override
	void initState() {
		super.initState();

		//NEW CODE: Load theme from sharedPreference
		loadActiveTheme(context);
	}

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			
			//Applying theme to the app
			theme: currentTheme == AppThemes.light ? defaultTheme : darkTheme,
			
			home: Scaffold(
				appBar: AppBar(
					leading: Icon(Icons.home),
					title: Text("Moor Books Listing"),

					actions: [
						IconButton(
							icon: Icon(Icons.all_inclusive),

							onPressed: () {
								setState(() {
									switchTheme();
								});
							},
						)
					]
				),

				body: BooksListing(),
			),
		);
	}
}

List bookData() {
	return [
		{
			'title': 'Book Title',
			'authors': ['Author1', 'Author2'],
			'image': "assets/images/image_pic.png",

			'description': "In this chapter, you learned to create the layout for the user interface for BooksApp. Flutter widgets introduced in previous chapters like Column, Row, Padding, Flexible, Image, ListView are used to implement the interface. The Card widget is used to display the book’s title and authors’ list. You briefly touched on to parse book information from JSON formatted data entries and build an interface to display book information.",
		},

		{
			'title': 'Book Title 2',
			'authors': ['Author1'],
			'image': "assets/images/image_pic.png",

			'description': "In this chapter, you learned to create the layout for the user interface for BooksApp. Flutter widgets introduced in previous chapters like Column, Row, Padding, Flexible, Image, ListView are used to implement the interface. The Card widget is used to display the book’s title and authors’ list. You briefly touched on to parse book information from JSON formatted data entries and build an interface to display book information.",
		},

		{
			'title': 'Book Title 3',
			'authors': ['Author1'],
			'image': "assets/images/image_pic.png",

			'description': "In this chapter, you learned to create the layout for the user interface for BooksApp. Flutter widgets introduced in previous chapters like Column, Row, Padding, Flexible, Image, ListView are used to implement the interface. The Card widget is used to display the book’s title and authors’ list. You briefly touched on to parse book information from JSON formatted data entries and build an interface to display book information.",
		},

		{
			'title': 'Book Title 4',
			'authors': ['Author1'],
			'image': "assets/images/image_pic.png",

			'description': "In this chapter, you learned to create the layout for the user interface for BooksApp. Flutter widgets introduced in previous chapters like Column, Row, Padding, Flexible, Image, ListView are used to implement the interface. The Card widget is used to display the book’s title and authors’ list. You briefly touched on to parse book information from JSON formatted data entries and build an interface to display book information.",
		},
	];
}


class BooksListing extends StatelessWidget {
	final booksListing = bookData();

	@override
	Widget build(BuildContext context) {
		return ListView.builder(
			itemCount: booksListing == null ? 0 : booksListing.length,

			itemBuilder: (context, index) {
				return Card(
					shape: RoundedRectangleBorder(
						borderRadius: BorderRadius.circular(10.0),
					),

					elevation: 5,

					margin: EdgeInsets.all(10),

					child: Padding(
						padding: const EdgeInsets.all(8.0),

						child: Row(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,

							children: [
								Flexible(
									child: Column(
										crossAxisAlignment: CrossAxisAlignment.start,

										children: <Widget>[
											Text(
												'${booksListing[index]['title']}',
												style: TextStyle(
												fontSize: 14, fontWeight: FontWeight.bold),
											),

											Text(
												
												'${booksListing[index]['description']}',

												textAlign: TextAlign.justify,
												
												style: TextStyle(
													fontSize: 14, 
													
													fontWeight: FontWeight.bold
												),
											),

											SizedBox(
												height: 10,
											),

											booksListing[index]['authors'] != null
												? Text(
													'Author(s): ${booksListing[index]['authors'].join(", ")}',
													style: TextStyle(fontSize: 14),
												)

												: Text(""),
										],
									),
								),


								booksListing[index]['image'] != null
									? Container(
										height: 200,
										width: 250,

										child: Image.asset(
											booksListing[index]['image'],

											fit: BoxFit.fill,
										),
									)

									: Container(),

			
							],
						),
					),
				);
			},
		);
	}
}

/*
LOCAL DATABASE (MOOR LIBRARY)
The Local database implementation uses moor library, which is based 
on SQLite database. In this section, you’ll learn to save the preferred 
theme in the app’s Local database to persist the last selected theme across 
app restarts using Moor library(Moor: Persistence library for Dart).

The Moor is the reactive persistence library for Dart and Flutter 
applications. It lets tables to be defined in Dart or SQL while supporting 
it with seamless and easy to use query API and streaming results. It 
persists selected themes in Flutter application’s Local database using 
Moor plugin (moor plugin).

Package Dependencies
The following dependencies need to be added to pubspec.yaml configuration file.
• moor plugin (moor plugin): Persistence library built on top of sqlite for
Dart and Flutter. It works on Android, iOS, Web platforms, and native Dart
applications for persisting data in Local databases.

• moor_ffi plugin (moor_ffi plugin): This Flutter plugin generates Dart 
bindings to sqlite by using dart:ffi (dart:ffi library). The ‘ffi’ stands for 
Foreign Function Interface. This plugin can be used with Flutter and/or 
Dart VM applications and supports all platforms where sqlite3 is installed: 
iOS, Android (Flutter), macOS, Linux and Windows. However, at the time of
this writing Moor plugin is in mid of migration to cleaner implementation, 
and this plugin is being phased out. It is recommended to migrate to a
newer implementation (Phasing out the moor_ffi package). The newer 
implementation requires sqlite3_flutter_libs (sqlite3_flutter_libs) to be added 
as a dependency. We’ll be adding `sqlite3 _ flutter _ libs` 
(sqlite3_flutter_libs) dependency instead of `moor _ ffi plugin` (moor_ffi plugin).

• path_provider plugin (path_provider): This Flutter plugin is used for accessing 
file systems on Android and iOS platforms.

• path plugin (path): A cross-platform filesystem path manipulation library
for Dart.

• moor_generator plugin (moor_generator): This library contains the generator 
that turns your Table classes from moor into database code.

• build_runner plugin (build_runner): This package is used to generate files.

We need this package to be able to run this command 
`flutter packages pub run build _ runner build –delete-conflicting-outputs` 
to generate ‘*.g.dart’ files.

dependencies:
 moor: ^3.3.1
 sqlite3_flutter_libs: ^0.2.0

#Helper to find the database path on mobile
 path_provider: ^1.6.11
 path: ^1.7.0

dev_dependencies:
flutter_test:
 sdk: flutter
build_runner: ^1.10.2
moor_generator: ^3.3.1


continue from 175

*/ 