/*
Designing the application using widgets
is as simple as designing HTML.

Creating a new project
To create a new Flutter project from the Flutter starter app template:

Open the Command Palette (Ctrl+Shift+P (Cmd+Shift+P on macOS)).
Select the Flutter: New Project command and press Enter.
Select Application and press Enter.
Select a Project location.
Enter your desired Project name.


lib/main.dart - Entry point of the Flutter application
pubspec.yaml - Used by Pub, Flutter package manager


Scaffold is a top level widget next to MaterialApp widget used to
create UI conforming material design. It has two important 
properties, appBar to show the header of the application and body 
to show the actual content of the application.

Dart uses var keyword to declare the variable.
The final and const keyword are used to declare constants.

Lists and Maps: It is used to represent a collection of objects.
void main() {
          var list = [1,2,3,4,5];
          print(list);
}

Map can be defined as shown here:
void main() {
var mapping = {'id': 1,'name':'Dart'};
print(mapping);
}

Dynamic: If the variable type is not defined, then its default type is dynamic.

void main() {
dynamic name = "Dart";
print(name);
}


Decision Making and Loops
A decision making block evaluates a condition before the instructions 
are executed. Dart supports If, If..else and switch statements.
Loops are used to repeat a block of code until a specific condition is 
met. Dart supports for, for..in , while and do..while loops.

Functions
A function is a group of statements that together performs a specific task.

void main() {
          add(3,4);
}
void add(int a,int b) {
          int c;
          c=a+b;
          print(c);
}

Object Oriented Programming
Dart is an object-oriented language. It supports object-oriented 
programming features like classes, interfaces, etc.
A class is a blueprint for creating objects. A class definition 
includes the following:
 Fields
 Getters and setters
 Constructors
 Functions
Now, let us create a simple class using the above definitions:

class Employee {
          String name;

          //getter method
          String get emp_name {
                    return name;
          }

          //setter method
          void set emp_name(String name) {
                    this.name = name;
          }

          //function definition
          void result(){
                    print(name);
          }
}

void main() {
          //object creation
          Employee emp = new Employee();
          
          emp.name="employee1";
          emp.result(); //function call
}


Widget Build Visualization
In Flutter, widgets can be grouped into multiple categories based on their features, as
listed below:
 Platform specific widgets
 Layout widgets
 State maintenance widgets
 Platform independent / basic widgets

Platform specific widgets
Flutter has widgets specific to a particular platform - Android or iOS.
Android specific widgets are designed in accordance with Material design 
guideline by Android OS. Android specific widgets are called as Material 
widgets.
iOS specific widgets are designed in accordance with Human Interface 
Guidelines by Apple and they are called as Cupertino widgets.

Layout widgets
          Container: A rectangular box decorated using BoxDecoration widgets 
          with background, border and shadow.
          Center: Center its child widget
          Row: Arrange its children in the horizontal direction.
          Column: Arrange its children in the vertical direction.
          Stack: Arrange one above the another.

State maintenance widgets
In Flutter, all widgets are either derived from StatelessWidget or 
StatefulWidget. Widget derived from StatelessWidget does not have 
any state information but it may contain widget derived from StatefulWidget.

Text
Text widget is used to display a piece of string. The style of the string can 
be set by using style property and TextStyle class. The sample code for this 
purpose is as follows:
Text('Hello World!', style: TextStyle(fontWeight: FontWeight.bold))


7. Layout
Widgets build by composing other widgets normally use layout widgets
Type of Layout Widgets
Layout widgets can be grouped into two distinct category based on its child:
 Widget supporting a single child
 Widget supporting multiple child


9:
A state management can be divided into two categories based on the duration the
particular state lasts in an application.
 Ephemeral - Last for a few seconds like the current state of an animation or a single
page like current rating of a product. Flutter supports its through StatefulWidget.
 app state - Last for entire application like logged in user details, cart information,
etc., Flutter supports its through scoped_model.

Ephemeral State Management
Since Flutter application is composed of widgets, the state management is also 
done by widgets. The entry point of the state management is Statefulwidget. 
Widget can be inherited from Statefulwidget to maintain its state and its children 
state. Statefulwidget provides an option for a widget to create a state, State<T> 
(where T is the inherited widget) when the widget is created for the first time 
through createState method and then a method, setState to change the state 
whenever needed. The state change will be done through gestures. For example, 
the rating of a product can be changed by tapping a star in the rating widget


Application State - scoped_model:
Model:
Model encapsulates the state of an application. We can use as many Model (by inheriting
Model class) as needed to maintain the application state. It has a single method,
notifyListeners, which needs to be called whenever the Model state changes.
notifyListeners will do necessary things to update the UI.

ScopedModel
ScopedModel is a widget, which holds the given model and then passes it to all the
descendant widget if requested. If more than one model is needed, then we need to nest
the ScopedModel.

Single model
ScopedModel<Product>(
          model: item,
          child: AnyWidget()
)

Multiple model
ScopedModel<Product>(
          model: item1,
          child: ScopedModel<Product>(
                    model: item2,
                    child: AnyWidget(),
          ),
)

ScopedModel.of is a method used to get the model underlying the ScopedModel. 
It can be used when no UI changes are necessary even though the model is going 
to change. The following will not change the UI (rating) of the product.
ScopedModel.of<Product>(context).updateRating(2);


11. Flutter – Writing Android Specific Code
Platform specific functionality like camera, battery level, browser, etc., can 
be accessed easily through the framework.

Flutter code, Client and the platform code and Host binds to a common Message
Channel. Client sends message to the Host through the Message Channel. 
Host listens on the Message Channel, receives the message and does the 
necessary functionality and finally, returns the result to the Client through 
Message Channel.


















*/ 