// 3

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
        // This widget is the root of your application.
        @override
        Widget build(BuildContext context) {
                return MaterialApp(
                        title: 'Flutter Demo',

                        theme: ThemeData(
                                primarySwatch: Colors.blue,
                        ),

                        home: MyHomePage(title: 'Product layout demo home page'),
                );
        }
}


class MyHomePage extends StatelessWidget {
        MyHomePage({Key key, this.title}) : super(key: key);

        final String title;
        @override
        Widget build(BuildContext context) {
                return Scaffold(
                        appBar: AppBar(
                                title: Text(this.title),
                        ),

                        body: Center(
                                child:
                                        Text(
                                                'Hello World',
                                        )
                        ),
                );
        }
}


class ProductBox extends StatelessWidget {
        ProductBox({Key key, this.name, this.description, this.price, this.image})
        : super(key: key);

        final String name;
        final String description;
        final int price;
        final String image;

        Widget build(BuildContext context) {
                return Container(
                        padding: EdgeInsets.all(2),
                        height: 120,

                        child: Card(
                                child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                        children: <Widget>[
                                                Image.asset("assets/appimages/" + image),
                                                
                                                Expanded(
                                                        child: Container(
                                                                padding: EdgeInsets.all(5),

                                                                child: Column(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                        
                                                                        children: <Widget>[
                                                                                Text(this.name, style: TextStyle(fontWeight: FontWeight.bold)),

                                                                                Text(this.description),

                                                                                Text("Price: " + this.price.toString()),
                                                                        ],
                                                                )
                                                        )
                                                )
                                        ]
                                )
                        )
                ); 
        }
}

// 1:
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
// 	// This widget is the root of your application.
// 	@override
// 	Widget build(BuildContext context) {
// 		return MaterialApp(
// 			title: 'Hello World Demo Application',

// 			theme: ThemeData(
// 				primarySwatch: Colors.blue,
// 			),

// 			home: MyHomePage(title: 'Home page'),
// 		);
// 	}
// }

// class MyHomePage extends StatelessWidget {
// 	MyHomePage({Key key, this.title}) : super(key: key);

// 	final String title;

// 	@override
// 	Widget build(BuildContext context) {
// 		return Scaffold(
// 			appBar: AppBar(
// 				title: Text(this.title),
// 			),

// 			body: Center(
// 				child: Text( 'Hello World')
// 			),
// 		);
// 	}
// }


// 2:
// class MyHomePage extends StatelessWidget {
//         MyHomePage({Key key, this.title}) : super(key: key);

//         final String title;

//         @override
//         Widget build(BuildContext context) {
//                 return Scaffold(
//                         appBar: AppBar(
//                                 title: Text(this.title),
//                         ),
                        
//                         body: Center(
//                                 child: Text('Hello World')
//                                 child: Image.asset("assets/smiley.png")
//                                 child: Icon(Icons.email)
//                         ),
//                 );
//         }
// }