/*:
## Exercise - Create Functions

 Write a function called `introduceMyself` that prints a brief introduction of yourself. Call the function and observe the printout.
 */
func introduceMyself(){
    print("Myself mady, i am aspiring ios developer")
}
introduceMyself()
//:  Write a function called `magicEightBall` that generates a random number and then uses either a switch statement or if-else-if statements to print different responses based on the random number generated. `let randomNum = Int.random(in: 0...4)` will generate a random number from 0 to 4, after which you can print different phrases corresponding to the number generated. Call the function multiple times and observe the different printouts.
import Foundation

func magicEigthBall(){
    let randomNum = Int.random(in: 0...4) // will generate a number from 0 to 4
    switch(randomNum){
    case 0:
        print("zero")
    case 1:
        print("one")
    case 2:
        print("two")
    case 3:
        print("three")
    case 4:
        print("four")
    default:
        print("default")
    }
}
magicEigthBall()
magicEigthBall()
magicEigthBall()
/*:
page 1 of 6  |  [Next: App Exercise - A Functioning App](@next)
 */
