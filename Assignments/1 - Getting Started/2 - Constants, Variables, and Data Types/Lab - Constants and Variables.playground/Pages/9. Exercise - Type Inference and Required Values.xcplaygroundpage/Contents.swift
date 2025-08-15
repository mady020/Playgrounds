/*:
## Exercise - Type Inference and Required Values
 
 Declare a variable called `name` of type `String`, but do not give it a value. Print `name` to the console. Does the code compile? Remove any code that will not compile.
 */
var name:String
//print(name), will throw error that the name is used before initialization
//:  Now assign a value to `name`, and print it to the console.
name = "mady"
print(name)

//:  Declare a variable called `distanceTraveled` and set it to 0. Do not give it an explicit type.
var distaneTraveled:Double = 0 // swiftc infers this as int, after using type annotation its a double

//:  Now assign a value of 54.3 to `distanceTraveled`. Does the code compile? Go back and set an explicit type on `distanceTraveled` so the code will compile.
distaneTraveled = 54.3
// i have to set the type to double or float, in order to compile this code successfully

/*:
[Previous](@previous)  |  page 9 of 10  |  [Next: App Exercise - Percent Completed](@next)
 */
