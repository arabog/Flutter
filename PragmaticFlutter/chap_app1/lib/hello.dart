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


M ap
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
*/ 

// Let’s create a `Map` with the key and value of type `String` as below:
var techMap = {
	'Flutter': 'Dart',
	'Android': 'Kotlin',
	'iOS': 'Swift',
};

// CHECKING FOR KEY
// The `containsKey(String key)` method on the map returns a boolean true or
// false depending on whether the given `key` exists in the Map or not.

void main() {
	dynamic result;

	result = techMap.containsKey('Flutter');
	print(result);
}

// CHECKING FOR VALUE
// The `containsValue(String value)` method returns the boolean value as
// ‘true’ if the given value exists in the Map.
// void main() {
// 	dynamic result;

// 	result = techMap.containsValue('Dart');
// 	print(result);
// }
