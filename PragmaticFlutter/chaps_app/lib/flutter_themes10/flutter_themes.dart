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






*/ 
import 'package:flutter/material.dart';


class BookApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,

			home: Scaffold(
				appBar: AppBar(
					title: Text('Hello Books'),
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

													style: TextStyle(
														fontSize: 14, 
														
														fontWeight: FontWeight.bold
													),
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
			},
		);
	}
}
