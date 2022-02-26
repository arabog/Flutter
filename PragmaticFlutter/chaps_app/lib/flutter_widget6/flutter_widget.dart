/*
Image WIDGET
In this section, you’ll learn to use the Image (Image class) widget 
to display an image in the Flutter application from the local assets 
folder as well as over the Internet.

Local I mage
You will learn to display images from the local folder assets at the 
root level of the project. Create a folder assets at the project’s root level
if you don’t have one already. Add an image file that you want to display 
in the Flutter application’s screen. In order to add assets to your application, 
you need to add an `assets` section under the `flutter` section in the 
pubspec.yaml file.

flutter:
	assets:
		- assets/flutter_icon.png


Let’s create a method `loadLocalImage()` to return the Image widget. 
This widget is added as the child to the Container widget


import 'package:flutter/material.dart';

class ImageApp extends StatelessWidget {
	@override 
	Widget build(BuildContext context) {

		return MaterialApp(
			home: ImagePage(),
		);

	}
}

class ImagePage extends StatelessWidget {

	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Center(
					child: Text("Image Widget")
				),
			),

			body: Center (
				child: Container(
					width: 300,
					height: 300,
					padding: const EdgeInsets.all(20.0),

					child: loadLocalImage(),
				),
			),
		);
	}


	Widget loadLocalImage() {
		return Image.asset("assets/images/image_pic.png");
	}

}


Internet ( remote ) Image
The image can also be displayed using the URL. The `loadInternetImage()`
fetches and loads images in the Image widget using `Image.network()` con-
structor. This widget is added as the child to the Container widget.





import 'package:flutter/material.dart';

class ImageApp extends StatelessWidget {
	@override 
	Widget build(BuildContext context) {

		return MaterialApp(
			home: ImagePage(),
		);

	}
}

class ImagePage extends StatelessWidget {

	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Center(
					child: Text("Image Widget")
				),
			),

			body: Center (
				child: Container(
					width: 300,
					height: 300,
					padding: const EdgeInsets.all(20.0),

					child: loadInternetImage(),
				),
			),
		);
	}


	Widget loadInternetImage() {
		return Image.network("https://raw.githubusercontent.com/ptyagicodecamp/flutter_cookbook2/master/assets/flutter_icon.png");
	}

}


ToggleButtons WIDGET
We will use ToggleButtons (ToggleButtons class) widget to add two toggle 
buttons horizontally. The first button is to turn airplane mode off, and 
another is to turn airplane mode on.

Airplane Mode Off
When airplane mode is off, applications can access the Internet. The 
toggle button airplane_mode_off loads an image from an Internet URL.

Airplane Mode On
When airplane mode is on, the application can’t access the Internet 
and can only access the local assets. The toggle button airplane_mode_on 
loads an image from the local assets folder.


*/ 



import 'package:flutter/material.dart';

// import anoda component
// import 'text_field.dart';


class ImageApp extends StatelessWidget {
	@override 
	Widget build(BuildContext context) {

		return MaterialApp(
			home: ImagePage(),
		);

	}
}

class ImagePage extends StatefulWidget {
	ImagePage({Key key }) : super(key: key);

	@override
	_ImagePageState createState() => _ImagePageState();
}


bool isLocal = true;


class _ImagePageState extends State<ImagePage> {

	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Center(
					child: Text("Image Widget")
				),
			),

			body: Center (
				child: Column(
					children: [

						Container(
							width: 300,
							height: 150,
							
							padding: const EdgeInsets.all(10.0),

							child: isLocal == true
								? Image.asset("assets/images/image_pic.png")
								:  Image.network("https://raw.githubusercontent.com/ptyagicodecamp/flutter_cookbook2/master/assets/flutter_icon.png")
						),

						SizedBox(
							height: 10,
						),


						isLocal == true
							? Text(
								"Local",

								style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
							)

							: Text(
								"Internet",

								style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
							),

						
						SizedBox(
							height: 10,
						),


						ToggleButtons(
							children: [
								Icon(Icons.airplanemode_off),
								Icon(Icons.airplanemode_on),
							],

							isSelected: [!isLocal, isLocal],

							onPressed: (int index) {
								setState(() {
									isLocal = !isLocal;
								});
							}
						),

						SizedBox(
							height: 10,
						),

						// external compont
						// Container(
						// 	width: 300,
						// 	height: 100,
							
						// 	padding: const EdgeInsets.all(10.0),

						// 	child: TextFieldDemo(),
						// ),

					],
				),
			),
		);
	}

}

