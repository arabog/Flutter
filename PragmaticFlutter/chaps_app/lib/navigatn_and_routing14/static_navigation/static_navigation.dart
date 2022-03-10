import 'dart:convert'; 

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 

import '../../config/config.dart';


import '../booktile.dart';
import '../book_model.dart'; 
import '../book_details_page.dart';



List<BookModel> booksListing;

//Showing book listing in ListView 
class BooksAppNavStatic extends StatelessWidget {
	@override 
	Widget build(BuildContext context) { 
		return MaterialApp(
			debugShowCheckedModeBanner: false,

			// home: BooksListing(), 

			routes: <String, WidgetBuilder> {
				"/": (BuildContext context) => BooksListing(),

				"/details": (BuildContext context) => BookDetailsPage(
					book: booksListing[0],
				)
			},
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

	// print(booksListing);
	
	return list.map((e) => BookModel.fromJson(e)).toList(); 
}


class BooksListing extends StatefulWidget { 
	@override
	_BooksListingState createState() => _BooksListingState(); 
} 


class _BooksListingState extends State<BooksListing> { 
	// ds has been declared globally
	// List<BookModel> booksListing; 
	
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
				itemCount: booksListing == null ? 0 : booksListing.length,
				
				itemBuilder: (context, index) {					
					return GestureDetector(
						child: BookTile(bookModelObj: booksListing[index]),

						onTap: () => Navigator.pushNamed(context, "/details"),
						// },
					);
				},
			), 
		); 
	}
}
