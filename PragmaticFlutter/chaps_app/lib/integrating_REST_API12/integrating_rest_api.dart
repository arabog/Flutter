/*
Integrating REST API
This chapter is an introduction to fetching data from a remote REST 
(Representational state transfer) API (Application Programming Interface) 
in a Flutter app. 
The Representational state transfer is a software architectural style for an 
API that uses less bandwidth for data transfer. It uses HTTP requests to 
access data.

WHAT IS AN API?
An API (API) is an acronym for Application Programming Interface. An 
API lets two applications talk to each other. We will use API to fetch book 
information to learn to consume APIs in Flutter applications.
The Books API contains information about digitized books available through 
the Google Books Website. API is the way to facilitate the app to fetch 
information from this giant book database into our application.

FLUTTER CONFIGURATION
We need to enable Flutter to be able to make HTTP requests. We’ll use the 
http (http) package, a composable, Future-based library for making HTTP 
requests.

dependencies:
  flutter:
  sdk: flutter
  http: ^0.12.1

Importing the package
import 'package:http/http.dart' as http;

API KEY
An API key is a unique identifier given to a user, application, or developer 
to be able to make API requests. Requests to fetch public data from Google 
Books API need to be accompanied by either an API key or an access token. 
It is used to track the number of requests made by the app and to verify if the 
requests are being made from the authorized app. In the code, we’ll be using 
a variable `apiKey` to store the API key to access the Google Books API.

final apiKey = "YOUR_API_KEY";

API ENDPOINT
An endpoint is a place where the resource lives and where an API sends 
requests to. Usually, an endpoint is a URL of the service

Make http Request
At this point, you’re ready to make a REST API call to fetch book listing 
from your Flutter app. Let’s check out the code to make an HTTP call to 
Google Books API. The package http imported earlier is used to make the 
HTTP request in the code snippet below.

Let’s create a function `makeHttpCall()` to make such calls. The 
`http.get(...)` method returns a `Future` object. That’s why it must be 
called from an `async` function. This is the reason to mark `makeHttpCall()` 
function with `async` keyword. The await keyword is used to make network 
calls asynchronously without blocking the main thread. 

The following code returns the API response of the HtttpResponse 
(HttpResponse class) type. It will print this text on the console: `
flutter: Instance of 'Response'`.

Making HTTP request
Future<String> makeHttpCall() async { 
	final apiKey = "$YOUR_API_KEY";
	
	final apiEndpoint = 
	"https://www.googleapis.com/books/v1/volumes?key=$apiKey&q=python+programming"; 

	final http.Response response =
		await http.get(apiEndpoint, headers: {'Accept': 'application/json'});

	//This will print 'flutter: Instance of 'Response'' on console.
	print(response);
	return response.body; 
}


The `response.body` will return the body of the response, which is the actual 
book listing information that we’re interested in.

BUILDING SIMPLE INTERFACE
Let’s create a simple, scrollable interface that can accommodate the large 
text blob. Let’s create a simple Flutter app say, BooksApp, which makes 
a REST API call to fetch book listing data from Books API and later displays 
this big blob of text in a scrollable interface.

BooksApp Widget 
class BooksApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
		);

		home: BookListing(),
	} 
}

Next, we’ll work on BookListing, a StatefulWidget used as the homepage.
This widget actually makes the REST call to fetch books data. Since remote 
data is fetched asynchronously, it may not be available at the time of the 
building widget. The app may need to update the displayed data later on. 
The BookListing widget is a StatefulWidget. 
The StatefulWidget helps to rebuild the interface whenever data is 
changed/updated. It uses the `setState()`method to update the data. The 
interface rebuilds whenever data is changed inside the`setState()` method. 

The widget’s state is managed by the ` _ BookListingState` class. The `
_ BookListingState` defines the method to fetch book listings as the 
`fetchBooks()` method.
This is marked `async` to support making API calls asynchronously 
without blocking the app. The `build()` method makes the REST call using 
the `fetchBooks()` method and then goes on building its interface. The 
variable `booksResponse` of type `String` holds the data fetched from the 
HTTP call. The `fetchBooks()` method makes the remote call via
`makeHttpCall()` and receives data over the network asynchronously. It 
stores network response in variable `response`.
Later, `booksResponse` is updated with `response` in `setState()` method, 
and `build()` method is called to rebuild the interface again.

class BookListing extends StatefulWidget { 
	@override
	_BookListingState createState() => _BookListingState(); 
}

class _BookListingState extends State<BookListing> {
	String booksResponse;
	
	//method to fetch books asynchronously 
	fetchBooks() async {
		//making REST API call
		var response = await makeHttpCall(); 
		
		//Updating booksResponse to fetched remote data
		setState(() {
			booksResponse = response; 
		}); 
	}

	@override
	Widget build(BuildContext context) { 
		//fetching books listing
		fetchBooks();

		return Scaffold(
			body: SingleChildScrollView(
				child: booksResponse != null
					? Text("Google Books API response\n $booksResponse")
					: Text("No Response from API"),
			), 
		); 
	} 
}


Loading Data at App Startup
As you can see that `build()` method is triggered whenever `setState()` is 
updated. However, it may not be a wise choice because every time the 
interface is rebuilt, `fetchBooks()` will be called, and an API request in 
turn. It can quickly go in a cycle and end up making a network request 
every time. This could lead to numerous amounts of API calls to Google
Books API and can run out your free API quota limit quickly and/or can 
incur API request charges needlessly. 

To solve this problem, it makes sense to make sure that you make REST API 
call only whenever needed. In our case, we need to fetch data only once.

To do so, it makes sense to call `initState()` method from ` _ BookListingState`. 
This method is executed only one time in the lifecycle of the StatefulWidget

class _BookListingState extends State<BookListing> {
	String booksResponse;

	//method to fetch books asynchronously 
	fetchBooks() async {
		//making REST API call
		var response = await makeHttpCall(); 

		//Updating booksResponse to fetched remote data
		setState(() {
			booksResponse = response; 
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
			body: SingleChildScrollView(
				child: booksResponse != null
					? Text("Google Books API response\n $booksResponse")
					: Text("No Response from API"),
			),
		);
	}
}


Displaying Data in App
Now that we’ve remote data fetched and updated in the `booksResponse` 
variable, we are ready to display it in our interface. Since this data is a 
large blob of text, we need a widget that can adapt to scrolling if needed. 

The `SingleChildScrollView` widget can help with this requirement. It can 
accommodate a large blob of text in a scrolling manner. As soon as we start 
the app, it displays a message: ‘No Response from API’ onscreen since no 
data is available yet. The remote data is being fetched using the 
`await makeHttpCall()` method. The variable `booksResponse` is updated 
in the `setState()` method. The `setState` method triggers rebuilding the 
interface with newly fetched data, and a large text blob is displayed on 
the screen.

import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http; 
import '../config.dart'; 

//Making HTTP request 
Future<String> makeHttpCall() async { 
	final apiKey = "$YOUR_API_KEY"; 
	final apiEndpoint = "https://www.googleapis.com/books/v1/volumes?key=$apiKey&q=python"; 

	final http.Response response =
	await http.get(apiEndpoint, headers: {'Accept': 'application/json'});
	
	 //This will print `flutter: Instance of 'Response'` on console. 
	print(response); 
	return response.body; 
}


class BooksApp extends StatelessWidget { 
	@override 
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,

			home: BookListing(), 
		);
	} 
} 


class BookListing extends StatefulWidget { 
	@override 
	_BookListingState createState() => _BookListingState(); 
} 


class _BookListingState extends State<BookListing> { 
	String booksResponse; 

	//method to fetch books asynchronously 
	fetchBooks() async { 
		//making REST API call 
		var response = await makeHttpCall(); 

	//Updating booksResponse to fetched remote data 
	setState(() {
		booksResponse = response; }); 
	} 

	@override 
	void initState() { 
		super.initState(); 
		
		fetchBooks(); 
	} 

	@override 
	Widget build(BuildContext context) { 
		//fetching books listing 
		fetchBooks(); 
		
		return Scaffold(
			body: SingleChildScrollView(
				child: booksResponse != null
					? Text("Google Books API response\n $booksResponse")
					: Text("No Response from API"),
			), 
		); 
	} 
}

In the Modeling, you will learn about parsing JSON data and create object 
models to better manage code.
*/ 

import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http; 
// import '../config.dart'; 

//Making HTTP request 
Future<String> makeHttpCall() async { 
	final apiKey = "AIzaSyDia0hBKqs0Rd6gDc7zx1qUqF0NGjkzkPU"; 

	final apiEndpoint = "https://www.googleapis.com/books/v1/volumes?key=$apiKey&q=python+coding";

	final http.Response response =
		await http.get(
			Uri.parse(apiEndpoint), 
			
			headers: {'Accept': 'application/json'}
		);
	
	return response.body; 
}


class BooksApp extends StatelessWidget { 
	@override 
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,

			home: BookListing(), 
		);
	} 
} 


class BookListing extends StatefulWidget { 
	@override 
	_BookListingState createState() => _BookListingState(); 
} 


class _BookListingState extends State<BookListing> { 
	String booksResponse; 

	//method to fetch books asynchronously 
	fetchBooks() async { 
		//making REST API call 
		var response = await makeHttpCall(); 

	//Updating booksResponse to fetched remote data 
	setState(() {
		booksResponse = response; }); 
	} 

	@override 
	void initState() { 
		super.initState(); 
		
		fetchBooks(); 
	} 

	@override 
	Widget build(BuildContext context) { 
		//fetching books listing 
		fetchBooks(); 
		
		return Scaffold(
			body: SingleChildScrollView(
				child: booksResponse != null
					? Text("Google Books API response\n $booksResponse")
					: Text("No Response from API"),
			), 
		); 
	} 
}
