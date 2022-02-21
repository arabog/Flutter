/* 
https://github.com/ptyagicodecamp/pragmatic_flutter

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
An empty list can is declared using two square brackets ‘[]’. List items 
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


*/ 