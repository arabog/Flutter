/*
FutureBuilder ASYNC WIDGET
Sometimes applications don’t receive the data required to build the 
interface all at once. It can happen when data is being retrieved over 
the network from a server remotely. In such cases, information is 
received asynchronously using Dart’s Future (Future<T> class) or 
Stream (Asynchronous programming: streams) classes. The

FutureBuilder (FutureBuilder<T> class) is a widget that builds itself based on
the snapshot returned from the Future class.

In this example, we will mock two types of Future objects. The first sample
Future object is `_futureData`. It’ll return an integer ‘3’ after a delay of three
seconds.

Future Error Object
The second Future object, ` _ futureError`, returns an error with the message
‘Sample error’


class MyFutureBuilderWidget extends StatefulWidget {
	MyFutureBuilderWidget({Key key}) : super(key: key);

	@override
	_MyFutureBuilderWidgetState createState() => _MyFutureBuilderWidgetState();
}

class _MyFutureBuilderWidgetState extends State<MyFutureBuilderWidget> {
	Futute<int> _futureData  = 
		Future<int>.delayed(Duration(seconds: 3), () => 3);

	Futute<int> _futureData  = 
		Future<int>.delayed(Duration(seconds: 3), () => throw("Sample error"));

}


FutureBuilder Widget
The FutureBuilder (FutureBuilder<T> class) widget builds widgets for the
interface based on the snapshot received from the Future object. The Future
object ` _ futureData` is assigned to its `future` property. The `builder`
property is given to the constructor with `AsyncSnapshot<int> snapshot`.
It uses `snapshot` to build the `futureChild` widget. When the `snapshot`
has data, it displays the data received in a Text widget. If an error is received, then
an error message is displayed. When the app is still waiting for data to arrive, a cir-
cular progress indicator is shown. The `futureChild` is added as a child to the
Center widget.


FutureBuilder<int> {
	future: _futureData,

	builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
		Widget futureChild;

		if(snapshot.hasData) {
			// success
			futureChild = Text("Number received is ${snapshot.data}");
		} else if (snapshot.hasError) {
			// show error message
			futureChild = Text("Error occurred fetching data [${snapshot.error}]");
		} else {
			// waiting for data to arrive
			futureChild = CircularProgressIndicator();
		}


		return Center(
			child: futureChild,
		)
	}
}

The circular progress bar `CircularProgressIndicator()` is presented to the
user when waiting for data to arrive



*/ 

import 'package:flutter/material.dart';

///
void main() => runApp(FutureBuilderDemo());

class FutureBuilderDemo extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,

			home: MyFutureBuilderWidget(),
		);
	}
}

class MyFutureBuilderWidget extends StatefulWidget {
	MyFutureBuilderWidget({Key key}) : super(key: key);

	@override
	_MyFutureBuilderWidgetState createState() => _MyFutureBuilderWidgetState();
}

class _MyFutureBuilderWidgetState extends State<MyFutureBuilderWidget> {
	Future<int> _futureData = 
		Future<int>.delayed(Duration(seconds: 3), () => 3);

	Future<int> _futureError =
		Future<int>.delayed(Duration(seconds: 3), () => throw ("Sample error"));

	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("FutureBuilder Widget"),
			),


			body: Padding(
				padding: const EdgeInsets.all(20.0),

				child: FutureBuilder<int>(
					future: _futureData,

					builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
						Widget futureChild;

						if (snapshot.hasData) {
							//success
							futureChild = Text("Number received is ${snapshot.data}");
						} else if (snapshot.hasError) {
							//show error message
							futureChild = Text("Error occurred fetching data [${snapshot.error}]");
						} else {
							//waiting for data to arrive
							futureChild = CircularProgressIndicator();
						}

						return Center(
							child: futureChild,
						);
					},
				),
			),
		);
	}
}














// continue from pg 81