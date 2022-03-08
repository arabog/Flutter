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
		);
	}
}



// import 'package:flutter/material.dart';

// class BookTile extends StatelessWidget { 
// 	final book;
	
// 	const BookTile({Key key, this.book}) : super(key: key);

// 	@override
// 	Widget build(BuildContext context) {
// 		//Card widget
// 		//Card's child is Padding
// 		//Padding's child is Row
// 		//Row's children are Flexible and Image
// 		//Flexible's child is Column
// 		//Column's children are two Text widgets
		
// 		return Card(
// 			child: Padding(
// 				child: Row(
// 					children: [
// 						Flexible(
// 							child: Column(
// 								children: <Widget>[
// 									Text(),
									
// 									Text(),
// 								],
// 							),
// 						),

// 						Image.network()
// 					],
// 				),
// 			),
// 		);
// 	}
// }
