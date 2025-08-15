/*:
## Exercise - Variables
 
 Declare a variable `schooling` and set it to the number of years of school that you have completed. Print `schooling` to the console.
 */
var schooling = 16
print(schooling)
//:  Now imagine you just completed an additional year of school, and update the `schooling` variable accordingly. Print `schooling` to the console.
schooling += 1
print(schooling)

//:  Does the above code compile? Why is this different than trying to update a constant? Print your explanation to the console using the `print` function.
print("as schooling declared using var keyword, we can change its value to any integer")
print("swift is a type safe language, which means we cannot change the type of a variable once it is declared")
print("in  order to declare a variable that can store a specific type of value, we need to explicitly define the type of the variable using ':' after the name")
print("i figured out that, in order to declare a variable/constant that can store any kind of value, we can using 'Any' Keyword after :")

print("Swift compiler has a special module which is reponsible for type inference, which means that the compiler will determine the type of the variable/constant by using regular expressions, the compiler will see the value after the '=' , and if it matches the pattern lets say for a interger,double,string,bool literal, then the compiler will infer it as that type and you cannot change it")
/*:
[Previous](@previous)  |  page 3 of 10  |  [Next: App Exercise - Step Count](@next)
 */
