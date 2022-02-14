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

*/ 