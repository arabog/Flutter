/*
Navigation and Routing
In this chapter, we will learn about the three types of navigation 
and routing to implement navigation from the BookListing homepage 
to the BookDetailsPage screen. The BookDetailsPage page only 
displays the book details

SIMPLE BookDetailsPage SCREEN
In this section, you will learn to build a basic secondary page 
widget – BookDetailsPage, which is used as a placeholder to 
understand navigation and routing concepts in Flutter application.

The BookDetailsPage is a StatelessWidget with two children 
widgets: AppBar and Center. The AppBar widget displays the 
book’s title, and the Center widget is assigned to the `body` 
property for the Scaffold widget. This Center widget has a 
child Text widget to display the book’s detailed description.

import 'package:flutter/material.dart';
import 'book.dart';


class BookDetailsPage extends StatelessWidget {
	final BookModel book;

	const BookDetailsPage({Key key, this.book}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text(book.volumeInfo.title),
			),
			
			body: Center(
				child: Text(book.volumeInfo.description),
			),
		);
	}
}

The data structure BookModel was constructed in the chapter 
(Chapter 13: Data Modeling) from the Books API’s JSON response. 
The BookDetailsPage requires the currently selected book item 
information passed along to be able to render its title and description. 
The `book` object of BookModel data type provides the book’s title 
information as `book.volumeInfo.title`, and its description is 
available as `book.volumeInfo.description`. At this point, we 
display only the title and description in the book details page.

NAVIGATOR WIDGET
The Flutter framework implements navigation across multiple 
pages using the Navigator (Navigator class) widget. It’s a widget 
to manage children widgets using a stack discipline. There are 
three different ways to implement navigation in the Flutter 
application.














*/ 