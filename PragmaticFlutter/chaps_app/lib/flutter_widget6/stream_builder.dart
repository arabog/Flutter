/*
StreamBuilder ASYNC WIDGET
The StreamBuilder (StreamBuilder class) is a widget that builds itself based
on the asynchronous data events received from a Stream. A Stream (Stream<T>
class) is a source of asynchronous data events. Let’s create two mock streams to
understand the usage of StreamBuilder widget.

Stream Data Object
The ` _ streamData` is a stream of results/responses that send an integer ‘3’ 
after a delay of three seconds. It also introduces a delay of additional three 
seconds after yielding the event.

Stream<int> _streamData = (() async* {
	await Future<void>.delayed(Duration(seconds: 3));

	yield 3;

	await Future<void>.delayed(Duration(seconds: 3));
})();

Stream Error Object
The ` _ streamError` yields an error after a delay of three seconds.

Stream<int> _streamError = (() async* {
	await Future<void>.delayed(Duration(seconds: 3));

	yield throw ("Error in calculating number");
})();

StreamBuilder Widget
The StreamBuilder widget reads ` _ streamData` using its `stream` 
property. The `builder` takes the asynchronous snapshot events received 
from the stream and creates a child widget, `futureChild`. If an error is 
received, the error message is displayed on the screen in a Text widget. 
The `snapshot.connectionState` provides the state of the connection. 
When the connection state is `ConnectionState.done`, the data received 
is displayed in the Text widget. When the connection state is active, it 
says “Loading....” on the screen. In any other state, a circular progress 
indicator widget is shown on the screen.

*/ 

import 'package:flutter/material.dart';

///
void main() => runApp(StreamBuilderDemo());

class StreamBuilderDemo extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,

			home: MyStreamBuilderWidget(),
		);
	}
}

class MyStreamBuilderWidget extends StatefulWidget {
	MyStreamBuilderWidget({Key key}) : super(key: key);

	@override
	_MyStreamBuilderWidgetState createState() => _MyStreamBuilderWidgetState();
}

class _MyStreamBuilderWidgetState extends State<MyStreamBuilderWidget> {
	Stream<int> _streamData = (() async* {
		await Future<void>.delayed(Duration(seconds: 3));

		yield 3;

		await Future<void>.delayed(Duration(seconds: 3));
	})();

	Stream<int> _streamError = (() async* {
		await Future<void>.delayed(Duration(seconds: 3));

		yield throw ("Error in calculating number");
	})();


	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("StreamBuilder Widget"),
			),


			body: Padding(
				padding: const EdgeInsets.all(20.0),

				child: StreamBuilder<int>(
					stream: _streamData,

					builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
						Widget futureChild;

						if (snapshot.hasError) {
							//show error message
							futureChild = Text("Error occurred fetching data [${snapshot.error}]");
						} else if (snapshot.connectionState == ConnectionState.done) {
							//success
							futureChild = Text("Number received is ${snapshot.data}");
						} else if (snapshot.connectionState == ConnectionState.active) {
							//stream is connected but not finished yet.
							futureChild = Text("Loading....");
						} else if (snapshot.connectionState == ConnectionState.waiting) {
							//waiting for data to arrive
							futureChild = CircularProgressIndicator();
						} else {
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