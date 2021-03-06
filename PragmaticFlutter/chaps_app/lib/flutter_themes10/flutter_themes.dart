/*
Flutter Themes
Flutter theme is used to define application-wide stylings like colors, 
fonts, and text. There are two ways to implement themes in Flutter:

• Global Theme: Styling throughout the application. This chapter 
will define the global theme to style the BooksApp.
• Local Theme: Styling a specific widget. We will use the local theme to
style one part of the BooksApp. We will style the `BooksListing` widget
displaying books’ information without impacting other parts of the app.

GLOBAL THEME
A global theme is used to style the entire app all at once. Global themes 
are implemented using ThemeData (ThemeData class). We will create 
and use a Global theme for BooksApp using ThemeData to hold styling 
information for the material apps. The ThemeData widget uses the 
following properties to define styling attributes.

• The `brightness` (brightness property) property uses the `brightness`
property to assign light or dark color themes to the app.

• The `appBarTheme` (appBarTheme property) property: The
`appBarTheme` property defines the theme for the AppBar widget.

• The `iconTheme` (iconTheme property) property: The `iconTheme`
property of AppBarTheme declares theme selection for the icons used in
the app bar. 

However, the iconTheme property for the ThemeData widget
defines the icon colors for the whole app globally. 

The IconThemeData(IconThemeData class) class defines the 
color, size, and opacity of icons.

A ‘Home’ icon is added to the AppBar (AppBar class) widget to 
demonstrate styling icons in an app


Default Blue Theme
The blue theme comes by default with the Flutter starter application. 
The AppBar’s color scheme can be customized using the `appBarTheme` 
property. The default light blue theme is stored in the `defaultTheme` 
variable.

ThemeData defaultTheme = ThemeData(
// Define the default brightness and colors for the overall app.
	brightness: Brightness.light,

	primaryColor: Colors.blue,

	accentColor: Colors.lightBlueAccent,

	appBarTheme: AppBarTheme(
		color: Colors.blue,

		iconTheme: IconThemeData(
			color: Colors.white,
		),
	),
);

Using the Default Theme
The `defaultTheme` is assigned to the `theme` property of 
MaterialApp. The BooksApp in default theme.

MaterialApp(
	theme: defaultTheme,
	
	home: Scaffold(
		appBar: AppBar(
			leading: Icon(Icons.home),
			title: Text("Books Listing"),
		),

		body: BooksListing(),
	),
);

Light Pink Theme
Let’s change the primary and accent color to pink. Unless 
there’s an app bar specific styling needed, you don’t need 
to specify the `appBarTheme` property. The pink
theme is stored in the `pinkTheme` variable.

ThemeData pinkTheme = ThemeData(
// Define the default brightness and colors for the overall app.
	brightness: Brightness.light,

	primaryColor: Colors.pink,

	accentColor: Colors.pinkAccent,

Using Pink Theme
The `pinkTheme` is assigned to the `theme` property of 
MaterialApp. The BooksApp with pink colored theme.

MaterialApp(
	theme: pinkTheme,

	home: Scaffold(
		appBar: AppBar(
			leading: Icon(Icons.home),

			title: Text("Books Listing"),
		),

		body: BooksListing(),
	),
);

Dark Theme
Let’s define a dark theme for the BooksApp. The brightness 
property is set to dark. Primary and accent colors are 
modified to colors appropriate for a darker theme.
The dark theme is stored in the `darkTheme` variable.

ThemeData darkTheme = ThemeData(
	// Define the default brightness and colors for the overall app.
	brightness: Brightness.dark,

	primaryColor: Colors.orange,

	accentColor: Colors.yellowAccent,
);

Using Dark Theme
The `darkTheme` is assigned to the `theme` property of `MaterialApp`.

MaterialApp(
	theme: darkTheme,

	home: Scaffold(
		appBar: AppBar(
			leading: Icon(Icons.home),
			title: Text("Books Listing"),
		),

		body: BooksListing(),
	),
);

MODULARIZING THEMES
All themes can be kept in a separate file. This file needs to be imported 
into the referencing file. This helps to keep all the styling code together. 

You may be tempted to create a class with one static method for each 
theme. However, a class with only static methods is discouraged per 
this lint rule (avoid_classes_with_only_static_members).

If utility methods are not logically related in Dart, they shouldn’t be 
put inside a class. Such methods can be put at top-level in a dart file.
All global themes can be put in a file themes.dart to keep all themes 
together.


themes.dart
import 'package:flutter/material.dart';

//Themes definitions
ThemeData get defaultTheme => ThemeData(
	// Define the default brightness and colors for the overall app.
	brightness: Brightness.light,
	
	primaryColor: Colors.blue,

	accentColor: Colors.lightBlueAccent,

	appBarTheme: AppBarTheme(
		color: Colors.blue,

		iconTheme: IconThemeData(
			color: Colors.white,
		),
	),
);


ThemeData get pinkTheme => ThemeData(
	// Define the default brightness and colors for the overall app.
	brightness: Brightness.light,

	primaryColor: Colors.pink,
	
	accentColor: Colors.pinkAccent,
);


ThemeData get darkTheme => ThemeData(
	// Define the default brightness and colors for the overall app.
	brightness: Brightness.dark,

	primaryColor: Colors.orange,
	
	accentColor: Colors.yellowAccent,
);

Importing Themes
The ‘themes.dart’ is imported to access the `defaultTheme` 
from MaterialApp.

import 'themes.dart'
MaterialApp(
	theme: defaultTheme,

	home: Scaffold(
		appBar: AppBar(
			leading: Icon(Icons.home),
			title: Text("Books Listing"),
		),

		body: BooksListing(),
	),
);


USING CUSTOM FONTS
Download Font
The first step is to download the font that you want to use. 
I have downloaded the Pangolin (Pangolin) font from Google Fonts. 
Copy the ‘*.ttf’ file into the Flutter root project’s assets directory. 
I have created a ‘font’ directory under ‘assets’ to keep the
fonts-related files in one place.

Configuration
Once you have got a TTF file copied into the Flutter project, 
it’s time to add it in the ‘pubspec.yaml’ configuration.
```
fonts:
 - family: Pangolin
   fonts:
    - asset: assets/fonts/Pangolin-Regular.ttf

MaterialApp(
	theme: defaultTheme,

	home: Scaffold(
		appBar: AppBar(
			leading: Icon(Icons.home),

			title: Text(
				"Books Listing",
				style: TextStyle(fontFamily: 'Pangolin', fontSize: 30),
			),
		),

		body: BooksListing(),
	),
);


import 'package:flutter/material.dart';
import 'themes.dart';

class FlutterThemeApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,

			theme: defaultTheme,

			home: Scaffold(
				appBar: AppBar(
					leading: Icon(Icons.home),

					title: Center (
						child: Text(
							'Books Listing',

							style: TextStyle(
								fontFamily: 'Pangolin',

								fontSize: 30,
							),	
						),
					),
				),

				// body: BooksListing(),

			),
		);
	}

}


LOCAL THEME
The local theme is used to customize the theme of a part of the 
screen rather than the whole app. The local theme is applied 
by wrapping the target widget in the Theme widget and 
providing the custom ThemeData for its `data` property

Theme (
	data: ThemeData(
		//Implement custom theme here
	),

	//Theme is applied to TargetWidget
	child: TargetWidget,
);

Card C olor
The Card widget is wrapped as a child to the Theme (Theme class) 
widget. This widget applies the theme to its descendant widget(s) 
by assigning ThemeData to the `data` property of the Theme widget, 
as shown in the code snippet below.
The Card widget is assigned a pink color using the `cardColor` 
property of `ThemeData`.

Theme(
	//ThemeData local to Card widget
	data: ThemeData(
		cardColor: Colors.pinkAccent,
	),

	child: ListView.builder(
		itemCount: booksListing == null ? 0 : booksListing.length,

		itemBuilder: (context, index) {
			return Card(
				...
			);
		},
	),
);

Book’ s Title TextTheme
We’ll use the custom font ‘Pangolin’ to style the book’s title in 
the Card widget. We’ll create a local text theme for the book’s 
title. The TextTheme (TextTheme class) widget is used to create 
a text theme. It applies material design text themes.
Its `headline6` property is assigned to a custom style. The book’s 
title applies this custom text theme by assigning its `style` property 
to `headline6`. The`headline6` style is accessed using `
Theme.of(context).textTheme.headline6`.

Theme(
	data: ThemeData(
	...,
		textTheme: TextTheme(
			headline6: TextStyle(
				fontFamily: 'Pangolin', 
				fontSize: 20,
			),
		),
	),
),


child: ListView.builder(
	itemCount: booksListing == null? 0 : booksListing.length,

	itemBuilder: (context, index) {
		return Card(
			...
			Text(
				'${booksListing[index]['title']}',

				//Using custom text theme
				style: Theme.of(context).textTheme.headline6,
			),
			...
		);
	},

);

Extending Parent’s TextTheme
The parent’s theme can be extended to customize to your needs 
using the `copyWith`(copyWith method) method. We will customize 
the parent’s text theme `bodyText2`to the italic font style. The 
`bodyText2` is accessed from book’s authors’ list Text widget’s 
style using `Theme.of(context).textTheme.bodyText2`.

Theme(
	data: ThemeData(
	...,
		textTheme: TextTheme(
			bodyText2: Theme.of(context)
			.copyWith(
				textTheme: TextTheme(
				bodyText2: TextStyle(fontStyle: FontStyle.italic),
			),
		).textTheme.bodyText2,
	),
),

child: ListView.builder(
	itemCount: booksListing == null? 0 : booksListing.length,

	itemBuilder: (context, index) {
		return Card(
			...
			Text(
				'Author(s): ${booksListing[index]['authors'].join(", ")}',
				
				//Using custom text theme
				style: Theme.of(context).textTheme.bodyText2,
			),
			...
		);
	},
	
);


import 'package:flutter/material.dart';
import 'themes.dart';

class FlutterThemeApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,

			theme: defaultTheme,

			home: Scaffold(
				appBar: AppBar(
					leading: Icon(Icons.home),

					title: Center (
						child: Text(
							'Books Listing',

							style: TextStyle(
								fontFamily: 'Pangolin',

								fontSize: 30,
							),	
						),
					),
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
				),
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


SWITCHING THEMES
So far, you have learned to create different types of themes. In 
real-world applications, you may want to provide functionality 
in your app to switch from one type of theme to another. It’s a 
popular use case to toggle between light to dark themes and
vice versa. For this purpose, the app needs to remember the  
state of the app. The BooksApp widget needs to be a StatefulWidget 
to keep track of the currently selected theme. The themes are 
represented using enumeration `AppThemes`.

enum AppThemes { light, dark }

The ` _ BooksAppState` holds the `currentTheme`.

class _BooksAppState extends State<BooksApp> {
	var currentTheme = AppThemes.light;
}

The MaterialApp use `theme` property to apply the currently 
selected theme as below:
```
MaterialApp(
	...
	theme: currentTheme == AppThemes.light ? defaultTheme: darkTheme,
	...
}

Note: The `defaultTheme` and `darkTheme` are defined in themes.dart 
file, and are imported using `import 'themes.dart'`.

An IconButton (IconButton class) widget is added in the AppBar 
widget to facilitate theme switching. Pressing on this icon button 
toggles the `currentTheme`. If a light theme is selected, then `
currentTheme` is assigned to `darkTheme` or vice versa. The 
`currentTheme` is updated inside the `setState` method. The updated
value forces MaterialApp to rebuild and applies the currently selected 
theme.

appBar: AppBar(
	...
	actions: [
		IconButton(
			icon: Icon(Icons.all_inclusive),

			// Toggling from light to dark theme and vice versa
			onPressed: () {
				setState(() {
					currentTheme = currentTheme == AppThemes.light
						? AppThemes.dark
						: AppThemes.light;
				});
			},
		)
	]
)


The BooksApp widget look like as below:

import 'themes.dart';

//BooksApp's entry point
void main() => runApp(BooksApp());

//StatefulWidget
class BooksApp extends StatefulWidget {
	@override
	_BooksAppState createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
	var currentTheme = AppThemes.light;
	
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,

			//NEW CODE: applying selected theme
			theme: currentTheme == AppThemes.light ? defaultTheme : darkTheme,
			
			home: Scaffold(
				appBar: AppBar(
					leading: Icon(Icons.home),

					title: Text("Books Listing"),

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

The BookListing widget remains the StatelessWidget because 
there’s no need to update this part of the interface.

Light Theme
The default selected theme is a light blue theme.The default theme 
is defined as below in the ‘themes.dart’ file:

*/ 
// import 'package:flutter/material.dart';
// import 'themes.dart';


// enum AppThemes { light, dark }

// //StatefulWidget
// class FlutterThemeApp extends StatefulWidget {
// 	@override
// 	_FlutterThemeAppState createState() => _FlutterThemeAppState();
// }


// class _FlutterThemeAppState extends State<FlutterThemeApp> {
// 	var currentTheme = AppThemes.light;
	
// 	@override
// 	Widget build(BuildContext context) {
// 		return MaterialApp(
// 			debugShowCheckedModeBanner: false,

// 			//NEW CODE: applying selected theme
// 			theme: currentTheme == AppThemes.light ? defaultTheme : darkTheme,
			
// 			home: Scaffold(
// 				appBar: AppBar(
// 					leading: Icon(Icons.home),

// 					title: Text("Books Listing"),

// 					actions: [
// 						IconButton(
// 							icon: Icon(Icons.all_inclusive),

// 							//NEW CODE: Toggling from light to dark theme and vice versa
// 							onPressed: () {
// 								setState(() {
// 									currentTheme = currentTheme == AppThemes.light
// 									? AppThemes.dark
// 									: AppThemes.light;
// 								});
// 							},
// 						)
// 					]
// 				),

// 				body: BooksListing(),
// 			),
// 		);
// 	}
// }


// List bookData() {
// 	return [
// 		{
// 			'title': 'Book Title',
// 			'authors': ['Author1', 'Author2'],
// 			'image': "assets/images/image_pic.png",

// 			'description': "In this chapter, you learned to create the layout for the user interface for BooksApp. Flutter widgets introduced in previous chapters like Column, Row, Padding, Flexible, Image, ListView are used to implement the interface. The Card widget is used to display the book’s title and authors’ list. You briefly touched on to parse book information from JSON formatted data entries and build an interface to display book information.",
// 		},

// 		{
// 			'title': 'Book Title 2',
// 			'authors': ['Author1'],
// 			'image': "assets/images/image_pic.png",

// 			'description': "In this chapter, you learned to create the layout for the user interface for BooksApp. Flutter widgets introduced in previous chapters like Column, Row, Padding, Flexible, Image, ListView are used to implement the interface. The Card widget is used to display the book’s title and authors’ list. You briefly touched on to parse book information from JSON formatted data entries and build an interface to display book information.",
// 		},

// 		{
// 			'title': 'Book Title 3',
// 			'authors': ['Author1'],
// 			'image': "assets/images/image_pic.png",

// 			'description': "In this chapter, you learned to create the layout for the user interface for BooksApp. Flutter widgets introduced in previous chapters like Column, Row, Padding, Flexible, Image, ListView are used to implement the interface. The Card widget is used to display the book’s title and authors’ list. You briefly touched on to parse book information from JSON formatted data entries and build an interface to display book information.",
// 		},

// 		{
// 			'title': 'Book Title 4',
// 			'authors': ['Author1'],
// 			'image': "assets/images/image_pic.png",

// 			'description': "In this chapter, you learned to create the layout for the user interface for BooksApp. Flutter widgets introduced in previous chapters like Column, Row, Padding, Flexible, Image, ListView are used to implement the interface. The Card widget is used to display the book’s title and authors’ list. You briefly touched on to parse book information from JSON formatted data entries and build an interface to display book information.",
// 		},
// 	];
// }


// class BooksListing extends StatelessWidget {
// 	final booksListing = bookData();

// 	@override
// 	Widget build(BuildContext context) {
// 		return Theme(

// 			data: ThemeData(

// 				cardColor: Colors.pinkAccent,

// 				textTheme: TextTheme(
// 					headline6: TextStyle(
// 						fontFamily: 'Pangolin',

// 						fontSize: 20,
// 					),

// 					bodyText2: Theme.of(context).copyWith(
// 						textTheme: TextTheme(
// 							bodyText2: TextStyle(
// 								fontStyle: FontStyle.italic
// 							),
// 						),
// 					).textTheme.bodyText2,
// 				)
// 			),


// 			child: ListView.builder(
// 				itemCount: booksListing == null ? 0 : booksListing.length,

// 				itemBuilder: (context, index) {
// 					return Card (
						
// 						shape: RoundedRectangleBorder(
// 							borderRadius: BorderRadius.circular(10.0),
// 						),

// 						elevation: 5,

// 						margin: EdgeInsets.all(10),

// 						child: Padding(
// 							padding: const EdgeInsets.only(left: 0, top: 0, right:16.0),

// 							child: Row(
// 								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								
// 								children: [
// 									Flexible(
										
// 										child: Padding(
// 											padding: const EdgeInsets.all(16.0),


// 											child: Column(

// 												crossAxisAlignment: CrossAxisAlignment.start,

// 												children: <Widget>[
// 													Text(
// 														'${booksListing[index]['title']}',

// 														style: Theme.of(context).textTheme.headline6,
// 													),

// 													SizedBox(
// 														height: 10,
// 													),

// 													Text(
														
// 														'${booksListing[index]['description']}',

// 														textAlign: TextAlign.justify,
														
// 														style: TextStyle(
// 															fontSize: 14, 
															
// 															fontWeight: FontWeight.bold
// 														),
// 													),

// 													SizedBox(
// 														height: 10,
// 													),

// 													booksListing[index]['authors'] != null
// 														? Text(
// 															'Author(s): ${booksListing[index]['authors'].join(", ")}',

// 															style: TextStyle(fontSize: 14),
// 														)

// 														: Text(""),
// 												],
// 											),
// 										),
// 									),


// 									booksListing[index]['image'] != null
// 										? Container(
// 											height: 200,
// 											width: 250,

// 											child: Image.asset(
// 												booksListing[index]['image'],

// 												fit: BoxFit.fill,
// 											),
// 										)

// 										: Container(),

// 								],
// 							),
// 						),				
// 					);
// 				}
// 			),
// 		);

// 	}
// }

import 'package:flutter/material.dart';

import 'themes.dart';

enum AppThemes { light, dark }

//Uncomment the line below to run from this file
//void main() => runApp(BooksApp());

//Showing book listing in ListView
class FlutterThemeApp extends StatefulWidget {
  @override
  _FlutterThemeAppState createState() => _FlutterThemeAppState();
}

class _FlutterThemeAppState extends State<FlutterThemeApp> {
  //NEW CODE
  var currentTheme = AppThemes.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //NEW CODE: applying selected theme
      theme: currentTheme == AppThemes.light ? defaultTheme : darkTheme,
      home: Scaffold(
        appBar: AppBar(
            leading: Icon(Icons.home),
            title: Text("Books Listing"),
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
            ]),
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


