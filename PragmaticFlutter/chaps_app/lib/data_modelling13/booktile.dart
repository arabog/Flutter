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
