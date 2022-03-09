/*
Data Modeling
In this chapter, you will learn to convert the response into 
JSON and parse it to render views in the Flutter ListView 
(ListView class) widget. 

Later in this chapter, the JSON formatted response is 
converted into the BookModel data model by mapping JSON
response into the data model class. These Dart objects are 
used to build the same book listing 4 Flutter user interface.

PARSING JSON
The JavaScript Object Notation or JSON is a type of data 
interchange format. The JSON format is programming language 
independent and text-based. It uses key/value pairs to store 
information and is human-readable. Dart provides the 
dart:convert (dart:convert library) library to parse JSON data.

The dart:convert LIBRARY
The dart:convert library parses the JSON response into the Dart 
collection Map. In the following code, the apiResponse is the 
response returned from http.get(apiEndPoint). 

The HTTP headers  are set to accept JSON encoding using 
`application/ json`. The json.decode(...) method takes the response’s 
body to parse it into Dart data structures. It returns a 
Map (Map<K, V> class) as a Future object. 

Futures are the objects that return the results of the 
asynchronous operations.

//importing the Dart package
import 'dart:convert';

//Making HTTP request
//Function to make REST API call 
Future<dynamic> makeHttpCall() async { 
	//API Key: To be replaced with your key
	final apiKey = "$YOUR_API_KEY"; 

	final apiEndpoint =
	"https://www.googleapis.com/books/v1/volumes?key=$apiKey&q=python+coding"; 
	
	final http.Response response = await http.get(
		apiEndpoint, 
		headers: {'Accept': 'application/json'}
	);

	//Parsing API's HttpResponse to JSON format
	//Converting string response body to JSON representation
	final jsonObject = json.decode(response.body); 

	//Prints JSON formatted response on console 
	print(jsonObject); 
	
	return jsonObject; 
}


The print(jsonObject) function prints the JSON object on the console.
We need only some parts of the book information to show in the BooksApp.


JSON FORMATTED RESPONSE
The jsonObject is a JSON encoded response from API. The 
JSON returned from the API looks like below. 

The JSON object consists of items key to hold an array of book
information. The API returns about ten items at one time by default. 
I have omitted a few attributes to simplify the structure. Each book 
or item contains the following attributes/keys returned from API:
	• volumeInfo
	• title: Book’s title.
	• subtitle: Book’s subtitle.• authors: Book’s authors.
	• publisher: Book’s publisher.
	• publishedDate: Publication date.
	• description: Book description.
	• imageLinks
		– smallThumbnail: Link to smaller sized thumbnail.
		– thumbnail: Link to thumbnail for book image.

	• saleInfo
		– saleability: Information whether a book is available for sale or not.
		– buyLink: Link to smaller sized thumbnail.

	• accessInfo
		– webReaderLink: Link to read the text in the browser.
	
	JSON data structure is shown below for one book entry.
	{
		"items": [
			{
				"volumeInfo": {
					"title": "Learning Python", 
					"subtitle": "Powerful Object-Oriented Programming",
					"authors": [
						"Mark Lutz"
					],
					"publisher": "\"O'Reilly Media,
					Inc.\"",
					"publishedDate": "2013-06-12",
					"description": "Get a comprehensive, in-depth ....,
				},

				"saleInfo": {
					"saleability": "FOR_SALE",

					"buyLink": "https://play.google.com/store/books/details?id=4pgQfXQvekcC&rdid=book-4pgQfXQvekcC&rdot=1&source=gbs_api"
				},
			}
		]
	}



Let’s re-examine the fetchBooks() method of _ BooksListingState class 
in the previous chapter (Chapter 12: Integrating REST API).

var booksListing;
fetchBooks() async { 
	var response = await makeHttpCall(); 
	
	setState(() {
		booksListing = response["items"]; 
	}); 
}


The items property in the JSON response above holds the list 
of books as JSON objects. The response is assigned to the results 
returned from the makeHttpCall()function. The booksListing is 
assigned to the response["items"] returned from the API. 

Since the response variable stores the JSON response above, 
response["items"] would give the list of books as a list of JSON 
objects. We will use this list of JSON objects to retrieve the
book information and eventually render it in Flutter applications. 

Note: The response["items"] returns a list of LinkedHashMap as 
List<dynamic>. LinkedHashMap (LinkedHashMap<K, V> class) i
s a Hashtable implementation of the Map. The LinkedHashMap 
preserves the insertion order of keys. 

Each JSON object of this list contains the book information that 
needs to be displayed in each row of the app’s books list.

In our app, we’re interested in displaying the title, authors, and 
thumbnail image of the book. We can use the following attributes 
from the above JSON object(s) to get that information. •
	• volumeInfo->title: title of the book. 
	• volumeInfo->description: description of the book 
	• volumeInfo->imageLinks->thumbnail: Link to thumbnail image 
		of the book’s cover page. 


Now that we know how to fetch and access information about the book 
listing, let’s start building the interface.


ListView WIDGET: LISTING ENTRIES 
In the previous chapter, a big blob of API responses was displayed 
on the main screen. In this section, you’ll see how to display each 
book entry in its own row using the ListView (ListView class) Flutter
widget.

ListView WIDGET
The ListView widget is used for laying out its children in a scrolling 
manner. One way to build a ListView widget is to use ListView.builder. 
It has two main properties: 
	• itemCount: This property includes the number of items to be 
	displayed in ListView. 
	• itemBuilder: This property takes an anonymous function with 
	two parameters (context, index) to render each row of the list. 
	The index keeps track of the number of the item in the list. 
	
A BuildContext (BuildContext class) is like the handle to the 
location of a widget in the widget tree.

We saw earlier that `booksListing = response["items"];` holds the 
entries of the books returned as the API response. 
The ListView.builder(...) creates a scrollable, linear array of book 
item widgets that can be created on-demand. We’ll be creating a 
BookTile widget to encapsulate the book item widget. This BookTile 
widget takes the current item from the booksListing and passes on 
book information for rendering in the list.

ListView.builder(
	itemCount: booksListing == null ? 0 : booksListing.length,

	itemBuilder: (context, index) {
		//current book information passed on to BookTile
		return BookTile(book: booksListing[index]); 
	}, 
),


CUSTOM WIDGET: BookTile
The BookTile widget is used to show each entry in the book listing. 
It consists of the book title, authors, and cover image information 
provided by API, along with a dividing gray line as the separator.


ANATOMY OF CUSTOM LIST ENTRY WIDGET
Let’s first understand the structure of the custom list entry widget. 
The custom list entry widget is built using the following primitive 
Flutter widgets:
	• Card Widget
	• Padding Widget
	• Row Widget
	• Flexible Widget
	• Column Widget
	• Text Widget
	• Image Widget

Since image, title, and overview text are aligned vertically, we 
can use the Column widget.


BookTile Stateless Widget
The BookTile widget can be a Stateless widget since it creates 
a part of the interface and doesn’t change its state afterward. 
Create a file booktile.dart to hold stateless BookTile widget 
class. The variable `final book` holds the current
book information passed from the ListView.builder() constructor.

import 'package:flutter/material.dart';

class BookTile extends StatelessWidget { 
	final book;

	const BookTile({Key key, this.book}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		//Card widget
		//Card's child is Padding
		//Padding's child is Row
		//Row's children are Flexible and Image
		//Flexible's child is Column
		//Column's children are two Text widgets
		
		return Card(
			child: Padding(
				child: Row(
					children: [
						Flexible(
							child: Column(
								children: <Widget>[
									Text(),

									Text(),
								],
							),
						),

						Image.network()
					],
				),
			),
		);
	}
}



Card Widget
The Card Widget (Card class) creates a Material Design Card 
(Cards). It’s a useful widget to show related information together. 
Since we want to display title, authors, and image related to one 
book item, it makes sense to use Card widget as a list entry. It has
slightly rounded corners and shadows that we can tweak.

The RoundedRectangleBorder for the shape attribute is used to 
assign a rounded corner shape to the Card widget. 

The elevation can be adjusted using the elevation property. 

The margin property is used to give spacing around the Card widget. 

The Padding widget was added as its child.

Card(
	shape: RoundedRectangleBorder( 
		borderRadius: BorderRadius.circular(10.0), 
	),

	elevation: 5,

	margin: EdgeInsets.all(10), 
	
	child: Padding(...),
)


Padding Widget
We want little space between the Card widget edges and Row widget. 
The Padding widget is used to give padding around the Row widget.

Padding(
	padding: const EdgeInsets.all(8.0),

	child: Row(),
)

Row WIDGET
The Row widget (Row class) aligns its children in a horizontal direction. 
Row widget is used to display the title and author text to the left side of 
the screen and the book’s cover page image to the right side. 

The mainAxisAlignment property tells Row how to place its children 
widgets in the available space. The MainAxisAlignment.spaceBetween 
helps to distribute the free space evenly between the children. The Row 
widget has two children to display the book’s text details and image.

Row(
	mainAxisAlignment: MainAxisAlignment.spaceBetween,

	children: [ 
		Flexible(), 
		
		Image.network() 
	], 
)

Flexible WIDGET
The Flexible widget (Flexible class) is used to display the book’s 
text details. It uses the Column widget as its child to align title 
and author information vertically. The Flexible widget gives 
Column widget flexibility to expand to fill the available space in 
the main axis. If the book’s title is too long, it’ll expand vertically 
rather than overflowing.

Flexible(
	child: Column()
)


Column WIDGET
The Column widget (Column class) aligns its children vertically. 
The book’s title and author’s information are displayed in Column 
widget’s children. 

The crossAxisAlignment property is set to CrossAxisAlignment.start, 
which helps to place the children with their start edge aligned with 
the start side of the cross axis. This property makes sure that children 
widgets are aligned to the left of the Column widget.

Column(
	crossAxisAlignment: CrossAxisAlignment.start,

	children: <Widget>[ 
		Text(), 
		
		Text() 
	],
)


Text WIDGETS
The Text (Text class) widgets are used to display text. Two Text 
widgets are placed vertically in the Column widget. The first Text 
widget is for the book’s title text. The variable book is a parsed 
JSON response returned from the API for the given index. The
related piece of JSON is:

	"volumeInfo": {
		"title": "Learning Python",

		"authors": [
			"Mark Lutz"
		],
	}

The title is available at path 'volumeInfo'->'title'.
The authors’ list is available at path 'volumeInfo'->'authors'.


Text( 
	'${book['volumeInfo']['title']}',

	style: TextStyle(
		fontSize: 14,

		fontWeight: FontWeight.bold
	),
)

The second Text widget is to display the author(s) name(s). The 
author’s name(s) is available as a List. The authors’ name list is 
concatenated with commas. A null check is added to handle cases 
when there’s no author list available.

book['volumeInfo']['authors'] != null
	? Text( 
		Author(s): ${book['volumeInfo']['authors'].join(", ")}',

		style: TextStyle(fontSize: 14),
	)

	: Text(""),
)


Both Text widgets are styled with the same font size. However, 
the title is styled to be bold as well.


Image WIDGET
The Image widget is used to display the book’s cover page image. 
The `Image.network()` method uses network URL to load and 
display images. The fit property is assigned to BoxFit.fill, which 
helps to fit the image in the given target box. 

An empty Container widget is added when there’s no thumbnail 
information available.


book['volumeInfo']['imageLinks']['thumbnail'] != null
	? Image.network(
		book['volumeInfo']['imageLinks']['thumbnail'],
		
		fit: BoxFit.fill,
	)
	: Container(),


FINISHED CODE (PART 1): MAIN METHOT
import 'package:flutter/material.dart'; 


class BookTile extends StatelessWidget { 
	final book;

	const BookTile({Key key, this.book}) : super(key: key); 

	@override 
	Widget build(BuildContext context) { 
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
										'${book['volumeInfo']['title']}',
										
										style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
									),

									book['volumeInfo']['authors'] != null
										? Text(
											'Author(s): ${book['volumeInfo']['authors'].join(", ")}',

											style: TextStyle(fontSize: 14),
										)

									: Text(""),
								],
							),
						),

						book['volumeInfo']['imageLinks']['thumbnail'] != null
							? Image.network (
								book['volumeInfo']['imageLinks'] ['thumbnail'],

								fit: BoxFit.fill,
							)
							: Container(),
					],
				),
			),
		),
	}
}


FINISHED CODE (PART 1): MAIN METHOD
//importing the Dart package 
import 'dart:convert'; 

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 
import './booktile. dart'; 

// import '../../config.dart'; 

//Showing book listing in ListView 
class BooksApp extends StatelessWidget { 
	@override 
	Widget build(BuildContext context) { 
		return MaterialApp(
		debugShowCheckedModeBanner: false,

		home: BooksListing(), ); 
	} 
}


//Making HTTP request 
//Function to make REST APIcall 
Future<dynamic> makeHttpCall() async {
	 //API Key: To be replaced with your key final
	apiKey = "$YOUR_API_KEY";

	final apiEndpoint = "https://www.googleapis.com/books/v1/volumes?key=$apiKey&q=python+coding"; 

	final http.Response response = await http.get(
		apiEndpoint, 
		
		headers: {'Accept': 'application/ json'}
	); 
	
	//Parsing API's HttpResponse to JSON format 
	//Converting string response body to JSON representation 
	final jsonObject = json.decode(response.body); 

	//Prints JSON formatted response on console
	print(jsonObject); 

	return jsonObject; 
} 


class BooksListing extends StatefulWidget {
	@override 
	_BooksListingState createState() => _BooksListingState(); 
} 


class _BooksListingState extends State<BooksListing> { 
	var booksListing; 
	
	fetchBooks() async {
		var response = await makeHttpCall(); 

		setState(() {
			booksListing = response["items"];
		}
	} 

	@override 
	void initState() { 
		super.initState(); fetchBooks(); 
	} 
	
	@override 
	Widget build(BuildContext context) { 
		return Scaffold(
			appBar: AppBar(
				title: Text("Books Listing"),
			),

			body: ListView.builder(
				itemCount: booksListing == null ? 0 : booksListing. length,

				itemBuilder: (context, index) {
					return BookTile(book:

					booksListing[index]);
				},
				
			), 
		); 
	} 
}


CONSTRUCTING DATA MODEL
In this section, you’ll learn to create a data model object from a 
JSON formatted API response. We will create a BookModel Dart 
class to parse the JSON response returned from API. 

BookModel class will have members for each of the response["items"] 
JSON attributes returned as API response.

REVISITING BOOKS API RESPONSE STRUCTURE
The JSON response returned from Books API looks like a huge 
blob of string. It could be hard to access the attributes by calling 
their names every time from code. A spelling mistake can make 
debugging very hard. To avoid this problem, it makes sense to create 
a Dart object mapped to the response. 

We will call this class BookModel. 

Earlier, if you would want to access the ‘title’ of the book, you had 
to access it as response["items"]["volumeInfo"]["title"]. 

After mapping data to the BookModel class, you can access ‘title’ 
as bookModelObj.volumeInfo.title and so on.


CONSTRUCTING BookModel
Let’s create a BookModel class to hold the API listing data set. 
The BookModel class will have members for each attribute of the 
JSON response. 

THE BookModel.fromJson(...) 
The BookModel.fromJson(Map<String, dynamic> json) takes a
JSON map and assigns corresponding values to the BookModel 
object’s members. This is the entry point method that is called to 
parse JSON responses received from the network. In this case, 
JSON response attributes are tiered. Each tier will have its own
models. The BookModel class needs access to volumeInfo,
accessInfo, and saleInfo attributes/members.


BookModel CLASS
BookModel.fromJson() uses a factory constructor. The factory 
constructor is used when implementing a constructor that doesn’t 
always create a new instance of its class. It’s useful when getting 
an object from a cache rather than creating a duplicate.

class BookModel { 
	final VolumeInfo volumeInfo; 
	final AccessInfo accessInfo; 
	final SaleInfo saleInfo; 

	BookModel(
		{
			this.volumeInfo, 
			this.accessInfo, 
			this.saleInfo
		}
	); 

	factory BookModel.fromJson(Map<String, dynamic> json) { 
		return BookModel(
			volumeInfo: VolumeInfo.fromJson(json['volumeInfo']),

			accessInfo: AccessInfo.fromJson(json['accessInfo']),

			saleInfo: SaleInfo.fromJson(json['saleInfo'])
		); 
	}
}


VolumeInfo Class
The VolumeInfo class has a title, authors as its members. It has 
a reference to the ImageLinks class to access thumbnail information.


class VolumeInfo { 
	final String title; 
	final String subtitle; 
	final String description; 
	final List<dynamic> authors; 
	final String publisher; 
	final String publishedDate; 
	final ImageLinks imageLinks; 

	VolumeInfo(
		{
			this.title,
			this.subtitle,
			this.description,
			this.authors,
			this.publisher,
			this.publishedDate,
			this.imageLinks
		}
	); 


	factory VolumeInfo.fromJson(Map<String, dynamic> json) { 
		return VolumeInfo(
			title: json['title'],

			subtitle: json['subtitle'],

			description: json['description'],

			authors: json['authors'] as List,

			publisher: json['publisher'],

			publishedDate: json['publishedDate'],

			imageLinks: ImageLinks.fromJson(json['imageLinks'])
		); 
	} 
}


The ImageLinks class provides information about the image thumbnails.
A null check helps to handle cases where there’s no thumbnail information 
available.

class ImageLinks { 
	final String smallThumbnail; 
	
	final String thumbnail;

	ImageLinks(
		{
			this.smallThumbnail, 
			this.thumbnail
		}
	); 

	factory ImageLinks.fromJson(Map<String, dynamic> json) { 
		return ImageLinks( 
			smallThumbnail: json != null ? json['smallThumbnail'] : '', 
			
			thumbnail: json != null? json['thumbnail'] : ''
		);

	} 
}


AccessInfo Class
The AccessInfo class provides the webReaderLink, a link to the URL to 
read on the web.

class AccessInfo { 
	String webReaderLink; 
	
	AccessInfo(
		{
			this.webReaderLink
		}
	); 

	factory AccessInfo.fromJson(Map<String, dynamic> json) { 
		return AccessInfo(
			webReaderLink: json['webReaderLink']
		); 
	} 
}


SaleInfo Class
The class SaleInfo provides the link to buy the book as 'buyLink'.

class SaleInfo { 
	final String saleability; 
	
	final String buyLink; 
	
	SaleInfo(
		{
			this.saleability,

			this.buyLink
		}
	); 

	factory SaleInfo.fromJson(Map<String, dynamic> json) { 
		return SaleInfo(saleability: json['saleability'], buyLink: json['buyLink']); 
	} 
}


CONVERTING API RESPONSE TO BookModel LIST
In this section, you’ll learn to use the BookModel object to build a list of 
book entries returned from the API response. You will convert the API 
response to a list of BookModel objects. The makeHttpCall() function 
returns the Future of List<BookModel>


//Function to make REST API call 
Future<List<BookModel>> makeHttpCall() async {
	//API Key: To be replaced with your key
	final apiKey = "$YOUR_API_KEY";

	final apiEndpoint = "https://www.googleapis.com/books/v1/volumes?key=$apiKey&q=python+coding"; 
	
	final http.Response response = await http.get(
		apiEndpoint, 
		
		headers: {'Accept': 'application/ json'}
	);

	//Converting string response body to JSON representation
	final jsonObject = json.decode(response.body);

	var list = jsonObject['items'] as List;

	//return the list of Book objects
	return list.map((e) => BookModel.fromJson(e)).toList(); 
}


Passing BookModel to BookTile widget 
The booksListing holds the list of BookModel objects returned from 
the REST API call. The ListView.builder() builds the BookTile
widgets for each entry passing BookModel for the current index.

class _BooksListingState extends State<BooksListing> { 
	List<BookModel> booksListing;
	
	fetchBooks() async {
		var response = await makeHttpCall(); 
		
		setState(() {
			booksListing = response; 
		}); 
	}

	@override 
	Widget build(BuildContext context) { 
		return Scaffold(
			body: ListView.builder(
				itemCount: booksListing == null? 0 : booksListing. length,

				itemBuilder: (context, index) {
					//Passing bookModelObj to BookTile widget
					return BookTile(bookModelObj: booksListing[index]);
				},
			), 
		); 
	} 

}


Displaying Data 
Now, data values can be accessed from the BookModel object using its
members. For example, book['volumeInfo']['title']can be accessed as
bookModelObj.volumeInfo.title, and so on.



FINISHED CODE (PART 2): BOOKTILE WIDGET
The BookTile is a stateless widget.

import 'package:flutter/material.dart'; 
import 'book.dart'; 


class BookTile extends StatelessWidget { 
	final BookModel bookModelObj; 
	const BookTile({Key key, this.bookModelObj}) : super(key: key); 

	@override 
	Widget build(BuildContext context) {
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
										'${bookModelObj.volumeInfo.title}',
										
										style: TextStyle(
											fontSize: 14, 
											fontWeight: FontWeight.bold
										),
									),


								bookModelObj.volumeInfo.authors != null
									? Text(
										'Author(s): ${bookModelObj. volumeInfo.authors.join(", ")}',

										style: TextStyle(fontSize: 14),
									)
									: Text(""),
								],
							),
						),

						bookModelObj.volumeInfo.imageLinks.thumbnail != null
							? Image.network(
								bookModelObj.volumeInfo.imageLinks. thumbnail,

								fit: BoxFit.fill,
							)

							: Container(),
					],
				),
			), 
		); 
	} 
}


FINISHED CODE (PART 2): MAIN METHOD

//importing the Dart package 
import 'dart:convert'; 

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 

import '../../config.dart'; 
import 'book.dart'; 
import 'booktile.dart'; 

//Showing book listing in ListView 
class BooksApp extends StatelessWidget {
	@override 
	Widget build(BuildContext context) { 
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			home: BooksListing(), 
		); 
	} 
} 
	
	
//Making HTTP request 
////Function to make REST API call 
Future<List<BookModel>> makeHttpCall() async {
	API Key: To be replaced with your key final apiKey = "$YOUR_API_KEY"; 
	
	final apiEndpoint = "https://www.googleapis.com/books/v1/volumes?key=$apiKey&q=python+coding"; 

	final http.Response response = await http.get(
		apiEndpoint, 
		
		headers: {'Accept': 'application/ json'}
	); 
	
	//Parsing API's HttpResponse to JSON format 
	//Converting string response body to JSON representation
	final jsonObject = json.decode(response.body); 
	
	var list = jsonObject['items'] as List; 
	
	//return the list of Book objects 
	return list.map((e) => BookModel.fromJson(e)).toList(); 
}


class BooksListing extends StatefulWidget { 
	@override
	_BooksListingState createState() => _BooksListingState(); 
} 


class _BooksListingState extends State<BooksListing> { 
	List<BookModel> booksListing; 
	
	fetchBooks() async { 
		var response = await makeHttpCall(); 
	
		setState(() {
			booksListing = response; 
		}); 
	}


	@override 
	void initState() { 
		super.initState();
		
		fetchBooks(); 
	} 
	
	@override 
	Widget build(BuildContext context) { 
		return Scaffold(
			appBar: AppBar(
				title: Text("Books Listing"),
			),

			body: ListView.builder(
				itemCount: booksListing == null ? 0 : booksListing. length,
				
				itemBuilder: (context, index) {
					//Passing bookModelObj to
					BookTile widget
					
					return BookTile(bookModelObj: booksListing[index]);
				},
			), 
		); 
	}
}



// FINISHED CODE (PART 1):
import 'dart:convert'; 

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 
import './booktile.dart';

import '../config/config.dart';

//Showing book listing in ListView 
class BooksApp extends StatelessWidget { 
	@override 
	Widget build(BuildContext context) { 
		return MaterialApp(
			debugShowCheckedModeBanner: false,

			home: BooksListing(), 
		); 
	} 
}


//Making HTTP request 
//Function to make REST APIcall 
Future<dynamic> makeHttpCall() async {
	 //API Key: To be replaced with your key 
	final apiKey = apiKeyValue; 


	final apiEndpoint = "https://www.googleapis.com/books/v1/volumes?key=$apiKey&q=python+coding"; 

	final http.Response response = await http.get(
		Uri.parse(apiEndpoint),
		
		headers: {'Accept': 'application/ json'}
	); 
	
	//Parsing API's HttpResponse to JSON format 
	//Converting string response body to JSON representation 
	final jsonObject = json.decode(response.body); 

	print(jsonObject);

	return jsonObject; 
} 


class BooksListing extends StatefulWidget {
	@override 
	_BooksListingState createState() => _BooksListingState(); 
} 


class _BooksListingState extends State<BooksListing> { 
	var booksListing; 
	
	fetchBooks() async {
		var response = await makeHttpCall(); 

		setState(() {
			booksListing = response["items"];
		});
	} 

	@override 
	void initState() { 
		super.initState(); 
		
		fetchBooks(); 
	} 
	
	@override 
	Widget build(BuildContext context) { 
		return Scaffold(
			appBar: AppBar(
				title: Text("Books Listing from API"),
			),

			body: ListView.builder(
				itemCount: booksListing == null ? 0 : booksListing.length,

				itemBuilder: (context, index) {
					return BookTile(book: booksListing[index]);
				},
				
			), 
		); 
	} 
}

*/ 

import 'dart:convert'; 

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 

import './booktile.dart';

import '../config/config.dart';
// import 'book.dart'; 

//Showing book listing in ListView 
class BooksApp extends StatelessWidget {
	@override 
	Widget build(BuildContext context) { 
		return MaterialApp(
			debugShowCheckedModeBanner: false,

			home: BooksListing(), 
		); 
	} 
} 
	
	
Future<List<BookModel>> makeHttpCall() async {
	final apiKey = apiKeyValue; 
	
	final apiEndpoint = "https://www.googleapis.com/books/v1/volumes?key=$apiKey&q=python+coding"; 

	final http.Response response = await http.get(
		Uri.parse(apiEndpoint), 
		
		headers: {'Accept': 'application/ json'}
	); 
	
	final jsonObject = json.decode(response.body); 
	
	var list = jsonObject['items'] as List; 
	
	return list.map((e) => BookModel.fromJson(e)).toList(); 
}


class BooksListing extends StatefulWidget { 
	@override
	_BooksListingState createState() => _BooksListingState(); 
} 


class _BooksListingState extends State<BooksListing> { 
	List<BookModel> booksListing; 
	
	fetchBooks() async { 
		var response = await makeHttpCall(); 
	
		setState(() {
			booksListing = response; 
		}); 
	}


	@override 
	void initState() { 
		super.initState();
		
		fetchBooks(); 
	} 
	
	@override 
	Widget build(BuildContext context) { 
		return Scaffold(
			appBar: AppBar(
				title: Text("Books Listing"),
			),

			body: ListView.builder(
				itemCount: booksListing == null ? 0 : booksListing. length,
				
				itemBuilder: (context, index) {
					BookTile widget
					
					return BookTile(bookModelObj: booksListing[index]);
				},
			), 
		); 
	}
}
