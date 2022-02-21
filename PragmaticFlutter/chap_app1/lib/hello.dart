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

*/ 

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



