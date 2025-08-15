/*:
## Exercise - Functions and Optionals

 If an app asks for a user's age, it may be because the app requires a user to be over a certain age to use some of the services it provides. Write a function called `checkAge` that takes one parameter of type `String`. The function should try to convert this parameter into an `Int` value and then check if the user is over 18 years old. If he/she is old enough, print "Welcome!", otherwise print "Sorry, but you aren't old enough to use our app." If the `String` parameter cannot be converted into an `Int` value, print "Sorry, something went wrong. Can you please re-enter your age?" Call the function and pass in `userInputAge` below as the single parameter. Then call the function and pass in a string that can be converted to an integer.
 */
let userInputAge: String = "34e"
func checkAge(inputString:String) -> Int? {
    let intValue:Int? = Int(inputString)
    if let unwrapperIntValue = intValue{
        if unwrapperIntValue > 18{
            print("Welcome!")
        }else{
            print("Sorry, but you aren't old enough to use our app.")
        }
        return unwrapperIntValue
    }else{
        print("Sorry, something went wrong. Can you please re-enter your age?")
        return nil
    }
}
checkAge(inputString: userInputAge)
checkAge(inputString: "21")
checkAge(inputString: "15")
//:  Go back and update your function to return the age as an integer. Will your function always return a value? Make sure your return type accurately reflects this. Call the function and print the return value.
print(checkAge(inputString: "34e"))
print(checkAge(inputString: "12"))

//:  Imagine you are creating an app for making purchases. Write a function that will take in the name of an item for purchase as a `String` and will return the cost of that item as an optional `Double`. In the body of the function, check to see if the item is in stock by accessing it in the dictionary `stock`. If it is, return the price of the item by accessing it in the dictionary `prices`. If the item is out of stock, return `nil`. Call the function and pass in a `String` that exists in the dictionaries below. Print the return value.
var prices = ["Chips": 3.69, "Donuts": 1.89, "Juice": 4.99, "Apple": 0.70, "Banana": 0.53, "Broccoli": 1.99]
var stock = ["Chips": 4, "Donuts": 0, "Juice": 12, "Apple": 6, "Banana": 6, "Broccoli": 3]

func getCost(itemName:String) -> Double? {
    if stock[itemName] != nil{
        if let cost = prices[itemName] {
            return cost
        }else{
            return nil
        }
    }else{
        return nil // item out of stock
    }
}
print(getCost(itemName: "Chips"))
/*:
[Previous](@previous)  |  page 3 of 6  |  [Next: App Exercise - Food Functions](@next)
 */
