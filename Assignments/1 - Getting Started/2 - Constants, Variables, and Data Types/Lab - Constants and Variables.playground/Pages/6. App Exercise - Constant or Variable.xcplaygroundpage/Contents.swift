/*:
## App Exercise - Fitness Tracker: Constant or Variable?
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 There are all sorts of things that a fitness tracking app needs to keep track of in order to display the right information to the user. Similar to the last exercise, declare either a constant or a variable for each of the following items, and assign each a sensible value. Be sure to use proper naming conventions.
 
- Name: The user's name
- Age: The user's age
- Number of steps taken today: The number of steps that a user has taken today
- Goal number of steps: The user's goal for number of steps to take each day
- Average heart rate: The user's average heart rate over the last 24 hours
 */
var name:String = "mady"
print("The username is unlikely to be changed, it can be changed by the user, but there must be a limit to that")
var age:Int = 20
print("The age will change based on the users birth date, i can add date of birth as a let")
var numberOfSteps:Int = 1000
print("The number of steps changes frequently throughout the day")
let goalNumberOfSteps:Int = 2000
print("The daily step goal usually remains the same, but user can change the daily goal for sure though")
var averageHeartRate:Int = 74
print("The average heart rate changes regularly, in case of physical activity")
/*:
 Now go back and add a line after each constant or variable declaration. On those lines, print a statement explaining why you chose to declare the piece of information as a constant or variable.
 
[Previous](@previous)  |  page 6 of 10  |  [Next: Exercise - Types and Type Safety](@next)
 */
