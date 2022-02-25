/*
Chap 5:
This app will display this greeting in three different languages: 
Spanish (Hola Libros), Italian (Ciao Libri), and Hindi (हैलो िकताबे ) ,
in addition to the English language as the default. All other three 
greetings are stored in a List (List<E> class) data structure `greetings`.

FLUTTER WIDGETS
Stateless Widget
A StatelessWidget (StatelessWidget class) widget is immutable. Once 
it’s created, it can’t be changed. It doesn’t preserve its state. A stateless 
widget is created only once, and it cannot be rebuild at a later time. 
Stateless widget’s 'build()'method is called only once.



Let’s use the Container (Container Widget) widget to understand creating 
a custom StatelessWidget. A container widget is a convenience widget that 
combines common painting, positioning, and sizing widgets.
The following code snippet demonstrates how a Container widget is created 
in a stateless manner. This widget is created only once.


import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Container();
	}
}

Stateless widgets don’t keep track of their state. Once they are 
created, their value can’t be changed. If the value of the stateless 
widget needs to be changed, then new widgets need to be created 
with the updated value.

E.g:	Text, Icon, Card widget.
• Text widget: contains the immutable string of letters.
• Icon widget: is immutable and not meant for interaction.
• Card widget: is a material design card that is used to show
relevant information.


Stateful Widget
A StatefulWidget is mutable. It keeps track of the state.
It rebuilds several times over its lifetime. A Stateful 
widget’s `build()` method is called multiple times.


class MyStatefulWidget extends StatefulWidget {
	@override
	_MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<_MyStatefulWidget> {
	@override
	Widget build(BuildContext context) {
		return Container();
	}
}


Some of the examples of Stateful widgets are below. They’re meant 
to keep track of their state.
• Checkbox (Checkbox class): Keeps track of its state whether a 
checkbox is checked or not.
• Radio (Radio<T> class): Needs to remember its state if it’s 
selected or not.
• TextField (TextField class): The TextField widgets enable users 
to type in the text. That means it needs to keep track of what the 
user has already typed.

The MaterialApp widget is used to implement material design.
A Flutter application is a stateless widget because it’s immutable. 
It can have mutable and immutable widgets as its children. The `
HelloBooksApp` widget implements the `build()` method of
parent `StatelessWidget`. The `build()` method is responsible for 
composing the widgets to build the user interface. In this `build()`
method, MaterialApp widget is returned. The Text (Text class) widget
is used to display the ‘Hello Books’ text.


import 'package:flutter/material.dart';

void main() {
	runApp(HelloBooksApp());
}


class HelloBooksApp extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,

			home: Text("Hello Books"),
		);
	}
}



The Flutter app during development has a debug banner at the top 
right corner. You can remove it by setting the flag `
debugShowCheckedModeBanner` in MaterialApp to `false`.

ADD CUSHION AROUND THE TEXT
At this point, we have the text ‘Hello Books’ glued to the top of the 
screen. The top part of the screen is used for showing system notifications. 
The Text widget overlapping system notification is not a good design and 
usability decision. This is where the SafeArea (Google, 2020) widget comes 
in handy. Wrapping Text widget in SafeArea provides the safety padding to 
avoid the operating system level notifications.


import 'package:flutter/material.dart';

void main() {
	runApp(HelloBooksApp());
}


class HelloBooksApp extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,

			home: SafeArea(
				child: Text("Hello Books"),
			),
		);
	}
}


CENTER THE TEXT
Now that we have ‘Hello Books’ rendered with enough padding from 
the top, we want to display text in the middle of the screen. The Center 
(Center class) widget centers its child. Wrapping the Text (Text class) 
widget in the Center widget displays the ‘Hello Books’ in the screen’s center.

import 'package:flutter/material.dart';

void main() {
	runApp(HelloBooksApp());
}


class HelloBooksApp extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,

			home: SafeArea(
				child: Center(
					child: Text("Hello Books"),
				),
			),

		);
	}
}

dre seems to be no diff in display btw with(out) SafeArea

import 'package:flutter/material.dart';

void main() {
	runApp(HelloBooksApp());
}


class HelloBooksApp extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,

			home: Center(
				child: Text("Hello Books"),
			),
		);
	}
}


APP ANATOMY #1
The HelloBooksApp is made of MaterialApp, SafeArea, Center, and 
Text widgets. The MaterialApp widget is at the root level. SafeArea 
widget is added as its child. SafeArea widget’s child is Center, which 
wraps a Text widget in it.


T he Scaffold W idget
The MaterialApp widget is the starting point of the app. It’s used to 
inform Flutter that the app is going to use material components 
(Components). Material components are interactive building blocks 
to create a user interface. The Scaffold widget is used as the child to 
MaterialApp widget. It implements the material design basic visual 
layout structure and provides basic functionalities like app bar, 
floating action button, etc., for the app.


import 'package:flutter/material.dart';

class HelloBooksApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(),
		);
	}
}

The AppBar Widget
The AppBar (AppBar class) widget implements the material design 
app bar. It assigns a title to the page using the `title` property.

import 'package:flutter/material.dart';

class HelloBooksApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(

				appBar: AppBar(
					title: Text("Hello Books")
				),

			),
		);
	}
}


The FloatingActionButton W idget
The FloatingActionButton (FloatingActionButton class) widget 
implements the material design floating action button. The Scaffold 
widget’s`floatingActionButton` property assigns FloatingActionButton 
to the app. The smiley icon is implemented using the Icon widget as a 
child to FloatingActionButton.


import 'package:flutter/material.dart';

class HelloBooksApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(

				floatingActionButton: FloatingActionButton (
					onPressed: () {},

					tooltip: "Greeting",

					child: Icon(Icons.insert_emoticon),
				),

			),
		);
	}
}


Styling Text Widget
The MaterialApp comes with a built-in material design text theme. 
It can be accessed using `Theme.of(context).textTheme` for the given 
widget. The theme supports different sizes for text. We’re choosing 
`headline4` to style the text.


class HelloBooksApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(

				body: Center(
					child: Text (
						"Hello Books",

						style: Theme.of(context).textTheme.headline4,
					),
				),

			),
		);
	}
}



import 'package:flutter/material.dart';

class HelloBooksApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(

				appBar: AppBar(
					// centerTitle: true,

					// title: Text("Hello Books")

					title: Center(
						child: Text('Hello Books'),
					),
				),

				body: Center(
					child: Text (
						"Hello Books",

						style: Theme.of(context).textTheme.headline4,
					),

					
				),

				floatingActionButton: FloatingActionButton (
					onPressed: () {},

					tooltip: "Greeting",

					child: Icon(Icons.insert_emoticon),
				),

				

				
			),
		);
	}
}


Managing State with StatefulWidget
We want to change the greetings text by clicking the smiley floating 
action button. 
First, we need to store all the greetings in a list. 
Second, we need to enable the floating action button to pick the next 
available string from the list.
We need StatefulWidget to keep track of the current state of the selected
greeting. This widget is assigned as `home` to MaterialApp.

import 'package:flutter/material.dart';

class HelloBooksApp extends StatelessWidget {
	@override 
	Widget build(BuildContext context) {
		return MaterialApp(
			home: MyHomePage(title: 'Hello Books'),
		);
	}
}


Stateful Widget: MyHomePage
The Stateful widgets are useful when a part of the screen needs to 
be updated with new information. In our app, we want to update 
the greeting text while rest of the screen remains unchanged. 
The MyHomePage extends StatefulWidget accepts a title parameter. 
The widget has a mutable state and represented using class `
_ MyHomePageState.


import 'package:flutter/material.dart';

class HelloBooksApp extends StatelessWidget {
	@override 
	Widget build(BuildContext context) {

		return MaterialApp(
			home: MyHomePage(title: 'Hello Books'),
		);

	}
}


class MyHomePage extends StatefulWidget {
	MyHomePage({Key? key, required this.title}) : super(key: key);

	final String title;

	_MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {}


State Widget : _ MyHomePageState
The widgets are rebuilt whenever the state change is requested 
from the `setState` (setState method) method.

FloatingActionButton is pressed by the user, which updates 
the currently selected greeting to display on the screen.


import 'package:flutter/material.dart';

class HelloBooksApp extends StatelessWidget {
	@override 
	Widget build(BuildContext context) {

		return MaterialApp(
			home: MyHomePage(title: 'Hello Books'),
		);

	}
}


class MyHomePage extends StatefulWidget {
	MyHomePage({Key? key, required this.title}) : super(key: key);

	final String title;

	_MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
	final List<String> greetings = [
		"Hello Books",
		'Hola Libros',
		'Ciao Libri',
		'हैलो िकताबें ',
	];

	int index = 0;
	String? current;

	void _updateGreeting() {
		setState(() {
			current = greetings[index];

			index = index == (greetings.length - 1) ? 0 : index + 1;
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold (
			appBar: AppBar(
				title: Center(
					child: Text(widget.title),
				)
			),

			body: Center (
				child: Text(
					greetings[index],

					style: Theme.of(context).textTheme.headline4,
				),
			),

			floatingActionButton: FloatingActionButton(
				onPressed: _updateGreeting,

				tooltip: 'Greeting',

				child: Icon(Icons.insert_emoticon),
			),
		);
	}
}

The `greetings` list contains greetings in four languages. The variable
`index` keeps the index of the currently selected item in the `greetings`
list. On pressing smiley floating action button or FAB, 
_ updateGreeting` method is called. The ` _ updateGreeting` method 
updates currently selected greeting text and updates `index` by one. 
The `index` is reset to zero when it reaches the end of the list.


Conclusion:
You are also introduced to the basic Flutter widgets like
MaterialApp, Container, AppBar, Scaffold, FloatingActionButton,
Text, StatelessWidget, and StatefulWidget.

Usage of container in:

StatelessWidget:
class MyStatelessWidget extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Container();
	}
}


StatefulWidget:
class ContainerUsage extends StatelessWidget {
	@override 
	Widget build(BuildContext context) {

		return MaterialApp(
			home: MyStatefulWidget(title: 'Hello Books'),
		);

	}
}

class MyStatefulWidget extends StatefulWidget {
	@override
	final String title,

	_MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
	@override
	Widget build(BuildContext context) {
		return Container();
	}
}
*/ 
