/*:
## Exercise - Types and Type Safety
 
 Declare two variables, one called `firstDecimal` and one called `secondDecimal`. Both should have decimal values. Look at both of their types by holding Option and clicking the variable name.
 */
var firstDecimal = 12.1
var secondDecimal = 14.2

//:  Declare a variable called `trueOrFalse` and give it a boolean value. Try to assign it to `firstDecimal` like so: `firstDecimal = trueOrFalse`. Does it compile? Print a statement to the console explaining why not, and remove the line of code that will not compile.
var trueOrFase = true
//firstDecimal = trueOrFase
// Cannot assign value of type 'Bool' to type 'Int'
print("as swift is a type safe language, we cannot assign a boolean value to a var which was declared as an double")
print("i think/assume that there is type checking functionality in the swift compiler under the type inference module which checks when the type is mismatch for example the user declares the variable to a int and give it a boolean value")
print("this feature of swift make it safe and better as programmer will not be able to make mistakes, and in order to fullfil a usecase where the there is no type safety the programmer can always use the Any keyword")
//:  Declare a variable and give it a string value. Then try to assign it to `firstDecimal`. Does it compile? Print a statement to the console explaining why not, and remove the line of code that will not compile.
var string = "string"
//firstDecimal = string
print("because of type safety of swift")
print("using this example, i think the faculty is telling us that the variable can only be given the value that it was declared with")
//:  Finally, declare a variable with a whole number value. Then try to assign it to `firstDecimal`. Why won't this compile even though both variables are numbers? Print a statement to the console explaining why not, and remove the line of code that will not compile.
var wholeNumber = 12
//firstDecimal = wholeNumber
print("Cannot assign value of type 'Bool' to type 'Int'") // we see this error
print("same answer as above")
/*:
[Previous](@previous)  |  page 7 of 10  |  [Next: App Exercise - Tracking Different Types](@next)
 */
