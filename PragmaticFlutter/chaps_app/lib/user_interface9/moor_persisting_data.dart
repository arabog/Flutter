/*
THE BooksApp ANATOMY: see d diagrams on pg 147

// ===================
class BooksApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,

			home: Scaffold(
				appBar: AppBar(
					title: Text("Books Listing")
				),

				body: BooksListing(),
			),
		);
	}
}

THE BooksApp ANATOMY: see d diagrams on pg 147
Let’s take a look at the BooksApp’s widget structure. The MaterialApp 
widget is at the root of the BooksApp. It has a Scaffold widget as its 
child. The Scaffold widget has an AppBar widget and ListView widget 
(i.e BooksListing) for its `body` property. 

The `ListView.builder()` is used to build the ListView of Card (Card 
class) widgets. Each Card widget displays  title, author, and image 
information for the book. We’re using mocked sample book data for 
demonstration purposes. It has two book entries. The ListView has 
two children of Card widgets.

ListView.builder has 2 children: 
	ListView.builder(
		itemCount: itemCount,

		itemBuilder: itemBuilder,
	)

// ===================

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
													fontSize: 14, 
													
													fontWeight: FontWeight.bold
												),
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

See pg 147 for d Card diagram

Card (
	
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
									fontSize: 14, 
									
									fontWeight: FontWeight.bold
								),
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
The Card widget has a Padding widget as its child. The Padding widget 
has its child, Row widget. The padding makes sure that the content of 
the Row widget is not bleeding over the edges. 

The Row widget displays its children horizontally. The Row widget has 
Flexible and Image as its children. The Flexible widget displays the 
book’s title and author list with the title at the top and author list to 
the bottom.

The Column widget is appropriate to align its children in vertical 
alignment. The Column widget has two Text widgets as its children. 
The first Text widget is to display the title of the book, and the 
second Text widget is to display the author list:.


IMPLEMENTING USER INTERFACE
The BooksApp extends StatelessWidget. The book listing is 
constructed in its own BooksListing widget. The BooksListing 
widget is a StatelessWidget as well. The book listing data is 
hardcoded in the `bookData()` method for demonstration purposes.

List bookData() {
	return [
		{
			'title': 'Book Title',
			'authors': ['Author1', 'Author2'],
			'image': "assets/images/image_pic.png"
		},

		{
			'title': 'Book Title 2',
			'authors': ['Author1'],
			'image': "assets/images/image_pic.png"
		}
	];
}


The first book entry has two authors and the second book has only 
one author. The same cover art is used for both books to keep it 
simple. The `bookData()` function returns a List of JSON (Introducing 
JSON) entries for each book. This data format is used for 
transferring data from one source to another.


BooksApp Widget
The BooksApp is the StatelessWidget. It uses MaterialApp in 
combination with the Scaffold widget. The Scaffold widget assigns 
the AppBar widget to the `appBar` property. The BooksListing widget 
is assigned to its `body`property. The `booksListing` is populated from 
data returned from the `bookData()` function.

class BooksApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,

			home: Scaffold(
				appBar: AppBar(
					title: Text("Books Listing")
				),

				body: BooksListing(),
			),
		);
	}
}


CUSTOM WIDGET: BooksListing
Let’s take a deeper look into implementing the BooksListing widget 
in this section. The `booksListing` is populated with data returned from 
the `bookData()` function. The `bookData()` function returns a list of 
JSON (Introducing JSON) entries for books. One JSON entry for each 
book. The `ListView.builder`widget iterates over each item of 
`booksListing`, and creates a Card widget for it.

class BooksListing extends StatelessWidget {
	final booksListing = bookData();

	@override
	Widget build(BuildContext context) {
		return ListView.builder(
			itemCount: booksListing == null ? 0 : booksListing.length,

			itemBuilder: (context, index) {
				return Card();
			}
		)
	}
}

A shape border can be drawn around the Card (Card class) widget. 
We are creating a rectangle border with rounded corners. The corner’s 
radius is assigned using the `borderRadius` property. The Card widget 
can be given elevation using the `elevation` property. The `margin` 
property is used to provide card spacing around it.

Card(
	shape: RoundedRectangleBorder(
		borderRadius: BorderRadius.circular(10.0),
	),

	elevation: 5,

	margin: EdgeInsets.all(10),
);


Padding Widget
The Padding (Padding class) widget is added as a child to the 
Card widget. It provides the inset around its child. We’ll give 
a default padding of 8 logical pixels.

Card(
	child: Padding(
		padding: const EdgeInsets.all(8.0),
	),
);

Row Widget
The Row widget displays its children in a horizontal array. We’ll use 
this array to display the book’s title, authors’ list to the left, and cover 
image to the screen’s right. The Row widget’s `mainAxisAlignment` 
attribute aligns the children widgets along its main axis, which is 
horizontal in this case. The `MainAxisAlignment.spaceBetween` 
property distributes free space available evenly between the chil-
dren widgets. The first child is the Flexible widget.

Card(
	child: Padding(
		child: Row(
			mainAxisAlignment: MainAxisAlignment.spaceBetween,

			children: [
				Flexible(),

				Image.asset(
					booksListing[index]['image'],
					fit: BoxFit.fill,
				),
			],
		),
	),
);

Flexible Widget
The Flexible widget renders the book’s title and its authors’ list 
in a Column widget. A Column widget renders its children vertically. 
The Flexible widget gives flexibility to its child, the Column widget’s 
to expand to fill the available space in its main axis. 

The main axis for the Column widget is vertical. The book’s title and 
authors’ list expand vertically rather than horizontally and hereby 
giving ample space for the cover image to render to the right side 
of the screen.

Flexible(
	child: Column(
		crossAxisAlignment: CrossAxisAlignment.start,

		children: <Widget>[
			Text(
				’${booksListing[index]['title']}',

				style: TextStyle(
					fontSize: 14, 
					fontWeight: FontWeight.bold
				),
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

In the code above, the `booksListing[index]['title']` provides the title of
the book. The TextStyle provides the styling like font size and font weight 
for the title text. The `booksListing[index]['authors']` provides the authors’
list. The list items are joined with a comma and display the items in the list 
as one string altogether. However, there could be cases when there’s no 
explicit authors’ list available for a given book. It’s a good practice to 
check for the data availability and show the widgets accordingly. If the 
authors’ list is empty, then show a Text widget with an empty string.

Image Widget
The cover art for the book is displayed using the Image widget. In this 
app, the book cover art is available in the ‘assets’ folder of the Flutter 
project root. Don’t forget to add the images under the ‘assets’ section 
of the ‘pubspec.yaml’ configuration file.

assets:
 - assets/book_cover.png

The image path is retrieved as `booksListing[index]['image']`. 
If the path is not available, then show an empty placeholder 
Container widget. The `BoxFit.fill` property is used to fill the 
image in the target box

booksListing[index]['image'] != null
	? Image.asset(
		booksListing[index]['image'],
		fit: BoxFit.fill,
	)

	: Container(),
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

