/* 
https://github.com/ptyagicodecamp/pragmatic_flutter

chap 1

THE main FUNCTION
The `main()` function is the entry point for any Dart program 

run in terminal using dart hello.dart

void main() {
	print("Hello Dart");
}


VARIABLES & DATA TYPES
void main() {
	var data = 1;

	print(data);
}

The above code snippet will print the ‘1’ on the console. The 
runtimeType property gives the runtime type of the object 
it’s called on

void main() {
	var data = 1;

	print(data);

	print(data.runtimeType);	// int
}


void main() {
	var data = "Monday";

	print(data)

	print(data.runtimeType);	// string
}


RE-ASSIGNING VARIABLE:
It’s valid for the `data` variable to get reassigned to a value from a 
different data type.There’s another keyword, `dynamic`, use to assign 
a value to a variable similar to the `var` keyword. The difference between 
the two is that for the `dynamic` keyword, the same variable can be 
reassigned to a different data type

void main() {
	var data = 1;

	print(data.runtimeType);

	// using dynamic keyword
	dynamic dynamicData = 1;
	print(dynamicData.runtimeType);		// int

	// re-assigning data to String data type
	dynamicData = "I'm a string now";
	print(dynamicData.runtimeType);	// Srting

}


COLLECTIONS:

LIST:
Dart’s List (List<E> class) is a collection that holds indexable objects. 
An empty list is declared using two square brackets ‘[]’. List items 
can be put inside these brackets separated by commas.

void main() {
	List emptyList = [];

	// checking if list is empty
	var result = emptyList.isEmpty;

	print(result);	// true
}

SPREAD OPERATOR
Dart 2.3 introduced the spread operator and null aware spread
operator to combine multiple lists into one.
Combining multiple lists can be done using spread (...) and 
null aware spread (?...) operators.


List emptyList = [];

List theList = ['Dart', 'Kotlin'];

// null list
List? theNullList;

/*
	Spread operator flatten d list for it to be mergeable to anoda list
	Null spread operator helps avoid runtime exceptions - iterator
	called on null
*/ 

List anodaList = ['Java', ...theList, ...?theNullList];

void main() {
	dynamic result;

	result = emptyList.isEmpty;
	print(result);
	
	print(anodaList);	// [Java, Dart, Kotlin]

}

TRANSFORM LIST ITEMS
The `map` on the `List` can be called to transform the list items. Let’s 
append the word ‘Language’ to objects of the `theList` list.

List theList = ['Dart', 'Kotlin'];

void main() {
	dynamic result;

	result = theList.map((e) => "$e Language").toList();

	print(result);	// [Dart Language, Kotlin Language]
}

FILTERING
The `where` method on `List` can help filter items meeting specific criteria.

List theList = ['Dart', 'Kotlin'];

void main() {
	dynamic result;

	result = theList.where((element) => element.toString().contains('a'));

	print(result);	// (Dart)
}


Set:
The Set (Set<E> class) data structure holds a collection of objects only once. The dupli-
cates are not allowed when storing data in `Set.

Set langSet = { 'Dart', 'Kotlin', 'Swift' };
Set sdkSet = { 'Flutter', 'Android', 'iOS' };

void main() {
	dynamic result;

	// adding 'Java' to Set
	langSet.add("Java");	// {Dart, Kotlin, Swift, Java}
	print(langSet);

	// remove Java from Set
	langSet.remove('Java');		// {Dart, Kotlin, Swift}
	print(langSet);

	// adding multiple items to each set
	langSet.addAll( ['C#', 'Java'] );
	print(langSet);		// { Dart, Kotlin, Swift, C#, Java }

	sdkSet.addAll( ['C#', 'Xamarin'] );
	print(sdkSet);	// {Flutter, Android, iOS, C#, Xamarin}
}

INTERSECTION OF TWO SET(S)
The `intersection` method on `Set` returns the shared items from 
both sets. The `langSet` and `sdkSet` both contain the ‘C#’ item in 
them. The intersection on those sets will return the ‘C#’.

Set langSet = { 'Dart', 'Kotlin', 'Swift' };
Set sdkSet = { 'Flutter', 'Android', 'iOS' };

void main() {
	dynamic result;

	// adding 'Java' to Set
	langSet.add("Java");	// {Dart, Kotlin, Swift, Java}
	print(langSet);

	// remove Java from Set
	langSet.remove('Java');		// {Dart, Kotlin, Swift}
	print(langSet);

	// adding multiple items to each set
	langSet.addAll( ['C#', 'Java'] );
	print(langSet);		// { Dart, Kotlin, Swift, C#, Java }

	sdkSet.addAll( ['C#', 'Xamarin'] );
	print(sdkSet);	// {Flutter, Android, iOS, C#, Xamarin}

	result = langSet.intersection(sdkSet);
	print(result);	// { 'C#' }
}

UNION OF TWO SET(S)
The `union` returns items combined from `langSet` and `sdkSet` without any
duplicates. Both sets contain ‘C#’, and it’ll be added in the `result` only once.


Set langSet = { 'Dart', 'Kotlin', 'Swift' };
Set sdkSet = { 'Flutter', 'Android', 'iOS' };

void main() {
	dynamic result;

	// adding 'Java' to Set
	langSet.add("Java");	// {Dart, Kotlin, Swift, Java}
	print(langSet);

	// remove Java from Set
	langSet.remove('Java');		// {Dart, Kotlin, Swift}
	print(langSet);

	// adding multiple items to each set
	langSet.addAll( ['C#', 'Java'] );
	print(langSet);		// { Dart, Kotlin, Swift, C#, Java }

	sdkSet.addAll( ['C#', 'Xamarin'] );
	print(sdkSet);	// {Flutter, Android, iOS, C#, Xamarin}

	// find intersectn
	result = langSet.intersection(sdkSet);
	print(result);	// { 'C#' }

	// find union
	result = langSet.union(sdkSet);
	print(result);	// {Dart, Kotlin, Swift, C#, Java, Flutter, Android, iOS, Xamarin}
}


Map
The Map (Map<K, V> class) data structure is a collection that contains key/value
pairs. A value is accessed using the key for that entry.

create a `Map` with a key of `int` type, and value is of `String` type.
var intToStringMap = Map<int, String>();

The new key/value pair can be added as shown in the code snippet below:
void main() {
	dynamic result;

	intToStringMap[1] = '1';

	intToStringMap[2] = '2';

	/*
		The first or last entry of the map can be accessed using `first` 
		and `last` properties of entries (entries property) iterable.
	*/ 
	// first Map entry
	result = intToStringMap.entries.first;
	print(result);	// MapEntry(1: 1)

	// last Map entry
	result = intToStringMap.entries.last;
	print(result);	// MapEntry(2: 2)
}



Let’s create a `Map` with the key and value of type `String` as below:
var techMap = {
	'Flutter': 'Dart',
	'Android': 'Kotlin',
	'iOS': 'Swift',
};

CHECKING FOR KEY
The `containsKey(String key)` method on the map returns a boolean true or
false depending on whether the given `key` exists in the Map or not.

void main() {
	dynamic result;

	result = techMap.containsKey('Flutter');
	print(result);
}

CHECKING FOR VALUE
The `containsValue(String value)` method returns the boolean value as
‘true’ if the given value exists in the Map.
void main() {
	dynamic result;

	result = techMap.containsValue('Dart');
	print(result);
}

ACCESSING ALL VALUES
All values of the key/value pairs in Map collection can be accessed calling
`foreach` on `values` as below:
var techMap = {
	'Flutter': 'Dart',
	'Android': 'Kotlin',
	'iOS': 'Swift',
};

void main() {
	// print all values
	techMap.values.forEach((element) {
		print("$element");
	});
}

Dart
Kotlin
Swift

ITERATING KEY/VALUE PAIRS
All key/value pairs in Map collection are iterated

var techMap = {
	'Flutter': 'Dart',
	'Android': 'Kotlin',
	'iOS': 'Swift',
};

void main() {
	// Iterates over all key-value pairs and prints them
	techMap.entries.forEach((element) {
		print("${element.value} is used for developing ${element.key} applications");
	});
}

Dart is used for developing Flutter applications.
Kotlin is used for developing Android applications.
Swift is used for developing iOS applications.


FUNCTIONS:
Let’s create a function that checks if the passed argument is ‘Flutter’ or not and
returns a boolean value. It returns true if it’s precise ‘Flutter’ or false other-
wise. Such functions are known as ‘Named Function’ because the function’s name
describes what they are intended to.

bool isFlutter(String str) {
	return str == "Flutter";
}

void main() {
	dynamic result;

	result = isFlutter("Flutter");
	print(result);	// true
}

Function with Optional Parameters
Let’s create a function `concat(...)` that joins two strings together when 
the second string is available. In such a case, the second string can be 
passed as optional using square brackets ‘[]’.
// Function with optional parameters in brackets []
String concat(String str1, [String? str2]) {
	return str2 != null ? "$str1 $str2" : str1;
}


void main() {
	dynamic result;

	 // Using function with optional params with brackets []
	result = concat('Priyanka', 'Tyagi'); 
	print(result);	// Priyanka Tyagi
}


// Named Parameters
The other way to provide optional parameters is to use named parameters. 
They can be passed using curly braces ‘{}’.

// Named Parameters: Function with optional parameters in curly braces []
String concat2(String str1, { String? str2 } ) {
	return str2 != null ? "$str1 $str2" : str1;
}

void main() {
	dynamic result;

	 // Using function with optional params with curly braces {}
	result = concat2('Priyanka', str2: 'Tyagi');
	print(result);	// Priyanka Tyagi
}

// without 2nd argument:
void main() {
	dynamic result;

	 // Using function with optional params with curly braces {}
	result = concat2('Priyanka');
	print(result);	// Priyanka 
}


Passing Function as Parameter
The Dart 2 programming language allows passing a function as a 
parameter to another function. Let’s create a function `int subtract(int a, int b)`
to find the difference between the two values ‘a’ and ‘b’. The method `calcu-
late(...)` takes two numbers and a function as a parameter to operate on the
values passed.


int substract (int a, int b) {
	return a > b ? a - b : b - a;
}

// passing fxn as parameter
int calculate(int value1, int value2, Function(int, int) function) {
	return function(value1, value2);
}

void main() {
	dynamic result;

	result = calculate(5, 4, substract);
	print(result);	// 1
}

Arrow Syntax
The arrow syntax can be used to write functions in one line


int add(int a, int b) => a + b;

void main() {
	dynamic result;

	result = add(5, 4);
	print(result);	// 9
}


Anonymous Function
dy don’t have a name and can be assigned to a variable either
using the keyword `var` or `Function.

Function anonymousAdd = (int a, int b) {
	return a + b;
};


void main() {
	dynamic result;

	result = anonymousAdd(5, 4);
	print(result);	// 9
}

CLASSES
Dart classes are created using the keyword `class`. Let’s define a 
class Person to represent a person in the real world. This person 
has a name, an age, and the food it eats.


class Person {
	String name;
	int age;
	String food;
}

Constructor
Dart supports easy to use constructors. Let’s see two types of constructors. The
short-form constructor looks like below. The first part is required. The parameters
inside ‘[]’ are optional.

class Person {
	String name;
	int age;
	String food;

	short-form constructor
	Person(this.name, [this.age])
}

Getters
The getters in Dart classes are defined using the `get` keyword. Let’s 
create a getter,`personName` to get the name.
```
String get personName => this.name;


Setters
The setters in the Dart classes are defined using the `set` keyword. Let’s 
create a setter `personName` to set the name as below:
```
set personName(String value) => this.name = value;

Method
Let’s add a method to the class `Person` to define the eating behavior. 
The method`eats(String food)` takes the food as `String` and assigns it 
to the class `food`property.
```
void eats(String food) {
	this.food = food;
}
// Usage
Person child = Person.basicInfo(name: "Krisha", age: 6);
child.eats("Pizza");

Let’s override the method `toString()` from the Object (Object class)
class toprint a custom message. Every class in Dart extends from the 
base Object class.
```
String toString() {
	return "My name is $name, and I like to eat $food";
}

//Usage
print(child.toString());
//Output on console
My name is Krisha, and I like to eat Pizza

// Another type of constructor is the named constructor. All parameters 
are enclosed in the curly braces ‘{}’.
class Person {
	String? name;
	int? age;
	String? food;

	// short-form constructor
	Person(this.name, [this.age]);

	// named constructor
	Person.basicInfo( { this.name, this.age } );

	  // Getter
	String? get personName => this.name;

	// Setter
	set personName(String? value) => this.name = value;

	 //Method
	void eats(String food) {
		this.food = food;
	}

	 //Overriding method from Object
	String toString() {
		return "My name is $name, and I like to eat $food";
	}
}

void main() {
	// usage: short-form
	Person person = Person("Priyanka");
	print(person.toString());

	// usage: named constructor
	Person child = Person.basicInfo(name: 'Krisha', age: 6);
	child.eats('Pizza');
	print(child.toString());

	child
		..name = 'Kalp'
		..eats("Pasta");
	print(child.toString());

	child
		..personName = 'Tanmay'
		..eats("Pesto");
	print(child.toString());
}


Cascading Syntax
Dart supports cascading syntaxes. It’s useful in assigning the values 
to properties and methods at once using two dots.
```
child
	..name = 'Kalp'
	..eats("Pasta");

The setters can also be called using cascaded syntax as shown in the 
code snippet below:
```
child
	..personName = 'Tanmay'
	..eats("Pesto");
*/ 