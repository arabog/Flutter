/*
Persisting Data:
In this chapter, you will learn to persist theme selection using two
approaches: Key/Value datastore (Shared preferences) and Local 
database. Shared preferences are the better choice when there’s a 
tiny amount of data that needs to be stored. Local database is a 
better choice for a huge dataset. In real-world applications, it 
makes sense to use the Shared preference approach to save theme 
selection. The difference between persisting data using Shared 
preferences plugin vs Local database is that Shared preferences 
plugin cannot guarantee persisting writes to disk after app 
restarts. However, saving data to a Local database is more 
reliable.

LIGHT THEME (DEFAULT)
The BooksApp launches for the first time in the default blue theme. 
The BooksApp’s theme can be changed to the dark theme by clicking 
on the app bar’s infinity icon.
However, if you exit the app and restart it again it restores to the light 
blue theme. This happened because the theme selection was not 
persisted permanently

KEY/VALUE DATA STORE (SHARED PREFERENCES PLUGIN)
The Shared preference approach uses key/value pairs to store 
information on the device using Shared Preference Flutter plugin 
(Shared preferences plugin). Shared preference plugin is useful in 
storing small sized data using key-value format on disk. This 
solution is useful when amount of data to be saved is relatively 
small like saving user preferences.

The iOS platform uses NSUserDefaults (NSUserDefaults) and 
Android platform uses SharedPreferences (SharedPreferences)
implementations to store simple data as key-value pairs to 
disk asynchronously.

The pubspec.yaml Dependency
The first step is to add the Shared preference plugin to the project’s 
dependencies in the pubspec.yaml file. At the time of this writing 
the shared_preferences plugin’s version is 0.5.8. Please update 
it to the latest version.

dependencies:
 flutter:
  sdk: flutter
 #SharedPreference-persisting theme selection
 shared_preferences: ^0.5.8


Loading Theme
The ` _ BooksAppState` class holds the active theme in the `currentTheme`
variable. The default theme is `AppThemes.light`. The theme settings are
restored from persistent store during the app’s startup from the `initState()`
method. The `loadActiveTheme(.)` gets the reference to Shared preference using
`SharedPreferences.getInstance()` which is an asynchronous operation.

The `await/async` keywords are used to get reference to SharedPreferences
class. The AppThemes enumeration’s index is used as theme id, and saved in the
Shared preference using key `theme _ id`. 

The app’s first launch will return `null` for `sharedPrefs.getInt('theme _ id')`, 
and `AppThemes.light.index` is assigned as default `themeId`. Once `themeId` 
is available, the `currentTheme` is assigned to the selected theme using `
AppThemes.values[themeId]`. The `currentTheme` is called from the `setState()`
method that rebuilds the MaterialApp widget, and hence reassigns `current-
Theme` to the `theme` property of the MaterialApp.

import 'package:shared_preferences/shared_preferences.dart';

...
class _BooksAppState extends State<BooksApp> {
	AppThemes currentTheme = AppThemes.light;

	// Fetching theme_id from SharedPreference
	void loadActiveTheme(BuildContext context) async {
		var sharedPrefs = await SharedPreferences.getInstance();

		//if theme_id key is null (not found), then set default theme
		int themeId = sharedPrefs.getInt('theme_id') ? ? AppThemes.light.index;
		
		setState(() {
			currentTheme = AppThemes.values[themeId];
		});
}


@override
void initState() {
	super.initState();

	// Load theme from sharedPreference
	loadActiveTheme(context);
}


@override
Widget build(BuildContext context) {
	return MaterialApp(
		//Applying theme to the app
		theme: currentTheme == AppThemes.light ? defaultTheme : darkTheme,
		...
	);
}

Persisting Theme
The `switchTheme()` method toggles the `currentTheme`, and 
saves the currently selected theme’s id in the Shared preference 
using key/value pair. The `switchTheme()` method is called from 
the `setState()` method that rebuilds the MaterialApp widget, and 
hence reassigns `currentTheme` to the `theme`property of 
the MaterialApp.

class _BooksAppState extends State<BooksApp> {
	AppThemes currentTheme = AppThemes.light;

	// Save theme_id using SharedPreference
	Future<void> switchTheme() async {
		currentTheme = currentTheme == AppThemes.light ? AppThemes.dark : AppThemes.light; 

		// save current selection
		var sharedPrefs = await SharedPreferences.getInstance();

		await sharedPrefs.setInt('theme_id', currentTheme.index);
	}
}



@override
Widget build(BuildContext context) {
	return MaterialApp(
		theme: currentTheme == AppThemes.light ? defaultTheme : darkTheme,

		home: Scaffold(
			appBar: AppBar(
				...,
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
		
		);
		
	)
}

*/ 

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../flutter_themes10/themes.dart';


enum AppThemes { light, dark }

//StatefulWidget
class PersistingDataApp extends StatefulWidget {
	@override
	_PersistingDataAppState createState() => _PersistingDataAppState();
}


class _PersistingDataAppState extends State<PersistingDataApp> {
	AppThemes currentTheme = AppThemes.light;


	// Fetching theme_id from SharedPreference
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
		
		// Load theme from sharedPreference
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

					title: Text("Persisting Data"),

					actions: [
						IconButton(
							icon: Icon(Icons.all_inclusive),

							//NEW CODE: Toggling from light to dark theme and vice versa
							onPressed: () {
								setState(() {
									currentTheme = currentTheme == AppThemes.light
									? AppThemes.dark
									: AppThemes.light;
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
		return Theme(

			data: ThemeData(

				cardColor: Colors.pinkAccent,

				textTheme: TextTheme(
					headline6: TextStyle(
						fontFamily: 'Pangolin',

						fontSize: 20,
					),

					bodyText2: Theme.of(context).copyWith(
						textTheme: TextTheme(
							bodyText2: TextStyle(
								fontStyle: FontStyle.italic
							),
						),
					).textTheme.bodyText2,
				)
			),


			child: ListView.builder(
				itemCount: booksListing == null ? 0 : booksListing.length,

				itemBuilder: (context, index) {
					return Card (
						
						shape: RoundedRectangleBorder(
							borderRadius: BorderRadius.circular(10.0),
						),

						elevation: 5,

						margin: EdgeInsets.all(10),

						child: Padding(
							padding: const EdgeInsets.only(left: 0, top: 0, right:16.0),

							child: Row(
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								
								children: [
									Flexible(
										
										child: Padding(
											padding: const EdgeInsets.all(16.0),


											child: Column(

												crossAxisAlignment: CrossAxisAlignment.start,

												children: <Widget>[
													Text(
														'${booksListing[index]['title']}',

														style: Theme.of(context).textTheme.headline6,
													),

													SizedBox(
														height: 10,
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
				}
			),
		);

	}
}


/*
LOCAL DATABASE (MOOR LIBRARY)
The Local database implementation uses moor library, which is based 
on SQLite database. In this section, you’ll learn to save the preferred 
theme in the app’s Local database to persist the last selected theme across 
app restarts using Moor library(Moor: Persistence library for Dart).
*/ 