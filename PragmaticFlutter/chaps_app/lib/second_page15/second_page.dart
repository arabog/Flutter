/*
The Second Page – BookDetailsPage Widget
In previous chapter (Chapter 12: Integrating REST API), we learned 
to make REST calls to Google Books API and fetch book listings. In 
chapter (Chapter 13: Data Modeling), we learned to render book 
listings in a list using the ListView widget. We also learned to create 
a custom widget – BookTile to generate each list item. The BookTile 
widget displayed only three essential information about the book: 
title, author(s), and image of the cover page. Later in chapter 
(Chapter 14: Navigation & Routing), we learned about navigation
from the homepage to another page. We started working on adding 
the second page – BookDetailsPage to display detailed information 
about the selected book. However, the BookDetailsPage only showed 
the book’s title in the appBar and its description in the screen’s main 
area. In this chapter, we will continue designing and implementing 
BookDetailsPage to display more relevant information about the 
given book.

ANATOMY OF BookDetailsPage WIDGET
Let’s start listing out the pieces of information that we are interested 
in displaying about the book.

• Book’s title and subtitle.
• Author(s) listing.
• Publication details like publisher and publishing date.
• Cover page imagery.
• Web reader link to preview book sample.
• Link to buy the book, if it is available for sale.
• Detailed book description.

Typically, the above can be categorized into three groups: quick 
book information, action items, and detailed description. Let’s 
rearrange the above information per their groups.
1. Book Information: Title, subtitle, authors, publisher, 
publication date, and cover imagery.
2. Action items: Web reader and buying links.
3. Detailed Description: Book’s detailed description.

BookDetailsPage SCREEN’S LAYOUT
Let’s layout the above three main interface elements in the 
BookDetailsPage screen. Like any other Flutter page, the 
Scaffold widget is the root of the page. The Scaffold widget 
has an AppBar widget to display the book’s title and the arrow 
button to navigate back to the last screen. The `body`property 
is assigned to SingleChildScrollView (SingleChildScrollView class).

It provides a box in which a widget can be scrolled. The scrolling 
widget is used to avoid the content overflow problem that may 
surface when the book’s description is too long to fit on the screen. 
The SingleChildScrollView widget occupies all the space on the 
screen and doesn’t leave any spacing around it. If we put any widget 
inside, it will expand to full screen as well. We will use the Padding 
widget to inset its child by `8.0` around all sides. Next, we want to 
vertically align book information, actions, and book description 
data. The Column widget helps to align its children in a vertical 
array. The Column widget uses the following three custom widgets 
to organize the book’s information on the BookDetailsPage screen.
1. InformationWidget
2. ActionsWidget
3. DescriptionWidget

IMPLEMENTING BookDetailsPage WIDGET
Now that you have an understanding of how the widgets are 
arranged in BookDetailsPage, it’s time to dive into code. The 
BookDetailsPage is a StatelessWidget. It receives the BookModel 
object `book` passed from the BookListing page. The title is retrieved 
as `book.volumeInfo.title`, and displayed in the AppBar. The Column 
widget’s contents are aligned to the starting off the screen using 
`crossAxisAlignment: CrossAxisAlignment.start`. The extra vertical 
space is divided evenly between children using 
`mainAxisAlignment: MainAxisAlignment.spaceBetween`. The 
Column widget has three children: InformationWidget, ActionsWidget, 
and DescriptionWidget. All three widgets are passed the BookModel 
object to render relevant information.

class BookDetailsPage extends StatelessWidget {
	final BookModel book;

	const BookDetailsPage({Key key, this.book}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text(book.volumeInfo.title),
			),

			body: SingleChildScrollView(
				child: Padding(
					padding: const EdgeInsets.all(8.0),
					
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						
						children: <Widget>[
							InformationWidget(
								book: book,
							),

							ActionsWidget(
								book: book,
							),

							DescriptionWidget(
								book: book,
							),
						],
					),
				),
			),
		);
	}
}

InformationWidget
The InformationWidget builds the top part of the BookDetailsPage. 
It displays the book’s title, subtitle, authors, publisher, publishing 
date, and cover imagery. There’s a total six-piece of information that 
needs to be displayed. The first five elements stay to the left of the 
screen, and cover imagery is aligned to the right side of the screen. 
All elements are aligned horizontally. It makes sense to use the Row
widget as the parent widget since it aligns its children in a horizontal 
array. The five elements to the right are arranged in a Flexible widget. 
The Column widget is assigned as a child to the Flexible widget. The 
Flexible widget provides the flexibility to its Column child to expand 
to fill the available space vertically. The Column holds all the five 
Text widgets as its children.

class InformationWidget extends StatelessWidget {
	final BookModel book;

	const InformationWidget({Key key, this.book}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Row(
			//Divides extra space evenly horizontally
			mainAxisAlignment: MainAxisAlignment.spaceEvenly,

			children: [
				Flexible(
					child: Column(
						//Children are aligned to start of the screen
						crossAxisAlignment: CrossAxisAlignment.start,

						//Divides extra space evenly vertically
						mainAxisAlignment: MainAxisAlignment.spaceEvenly,

						children: <Widget>[
							//Book Title
							//Book SubTitle
							//Author(s)
							//Publisher
							//PublishedDate
						],
					),
				),

				//Displaying cover image
			],
		);
	}
}

The book title, subtitle, author(s), publisher, and published date 
are rendered in a Text widget. The image is rendered in the Image 
widget. Only the non-null values are rendered in the Text and/or 
Image widget; otherwise, an empty Container widget is rendered. 
A style is applied to Text widgets to font size as fourteen and
bold font weight.

style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)

Let’s checkout implementations for each of the widgets in the code below:

class InformationWidget extends StatelessWidget {
	final BookModel book;

	const InformationWidget({Key key, this.book}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Row(
			mainAxisAlignment: MainAxisAlignment.spaceEvenly,

			children: [
				Flexible(
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						mainAxisAlignment: MainAxisAlignment.spaceEvenly,

						children: <Widget>[
							//Book Title
							book.volumeInfo.title != null
								? Text(
									’${book.volumeInfo.title}’,
									
									style: TextStyle(
										fontSize: 14, 

										fontWeight: FontWeight.bold
									),
								)
								: Container(),

							//Book subtitle
							book.volumeInfo.subtitle != null
								? Text(
									’${book.volumeInfo.subtitle}’,

									style: TextStyle(
										fontSize: 14,

										fontWeight: FontWeight.bold,

										fontStyle: FontStyle.italic
									),
								)
								: Container(),

							//Book authors. Used join() method on list to convert list into comma-separated String
							book.volumeInfo.authors != null
								? Text(
									’Author(s): ${book.volumeInfo.authors.join(", ")}’,

									style:TextStyle(
										fontSize: 14, 
										
										fontWeight: FontWeight.bold
									),
								)
								: Container(),

							//Publisher
							book.volumeInfo.publisher != null
								? Text(
									"Published by: ${book.volumeInfo.publisher}",

									style: TextStyle(
										fontSize: 14, 
										
										fontStyle:FontStyle.italic
									),
								)
								: Container(),

							//PublishedDate
							book.volumeInfo.publishedDate != null
								? Text(
									"Published on: ${book.volumeInfo.publishedDate}",

									style: TextStyle(
										fontSize: 14, 
										
										fontStyle: FontStyle.italic
									),
								)
								: Container(),
						],
					),
				),

				
				//Rendering cover page image
				book.volumeInfo.imageLinks.thumbnail != null
					? Image.network(
						book.volumeInfo.imageLinks.thumbnail,

						fit: BoxFit.fill,
					)

				: Container(),
			],
		);
	}
}

ActionsWidget
The ActionsWidget renders two material design floating action 
buttons (FABs) to let users read the sample and/or buy the book 
by clicking on respective buttons. These buttons are implemented 
using the FloatingActionButton (FloatingActionButton class) widget. 
Clicking on each button, launch the URL provides by Books API for 
the given book. For launching URL, the url _ launcher plugin 
(url_launcher plugin) is used.


Add this dependency in pubspec.yaml under the dependencies` section.
```
dependencies:
	#To open web reader link and buyLink from BookDetailsPage
	url_launcher: ^5.4.11

The ActionsWidget sits below the InformationWidget in 
BookDetailsPage. The ActionsWidget has a Padding widget 
at the top. The Padding widget has a child Row widget. The 
Row widget aligns its children horizontally. This Row widget
has two children of type FloatingActionButton or FAB with 
the extended variant. The FloatingActionButton.extended() 
method allows FAB to be more giant and have icons and 
label as well. The `onPressed: ` has the implementation 
to launch the URL for FAB.





*/ 