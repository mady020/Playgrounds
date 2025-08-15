struct Size{
    var width: Double
    var height: Double
    func area() -> Double{
        return width * height
    }
    func printArea(){
        print("Area is: \(area())")
    }
    init(_ width: Double, _ height: Double) {
        self.width = width
        self.height = height
    }
}

var size =  Size(12,10)
size.printArea()


//struct Car{
//    var odoMeter: Int
//    var speed: Int
//    var isRunning:Bool = false
//    var isStarted:Bool = false
//    init(_ odoMeter:Int, _ speed:Int){
//        self.odoMeter = odoMeter
//        self.speed = speed
//    }
//    func printCarStatus(){
//        print("The car's speed is \(speed) Km/h and the odoMeter is \(odoMeter) KM")
//    }
//    mutating func startEngine(){
//        print("Engine started")
//        isStarted = true
//    }
//    mutating func accelerate(){
//        if !self.isStarted{
//            print("Start the Car first!")
//            return
//        }
//        isRunning = true
//        self.speed += 10
//    }
//    mutating func decelerate(){
//        if !self.isStarted{
//            print("Start the Car first!")
//            return
//        }
//        self.speed -= 10
//    }
//}

//var car = Car(1000,410)
//car.printCarStatus()
//car.startEngine()
//car.accelerate()
//car.printCarStatus()
//car.accelerate()
//car.printCarStatus()
//car.accelerate()
//car.printCarStatus()
//car.decelerate()
//car.printCarStatus()


struct Temp{
    var celsius: Double{
        willSet{
            print("The value of celsius is going to get updated")
        }
        didSet{
            if celsius > oldValue{
                print("The temp is going up and day is becoming hot")
            }else{
                if celsius == oldValue{
                    print("Temp is unchanged!")
                }else{
                    print("The temp is going down and day is becoming cold")
                }
            }
        }
    }
    var fahrenheit: Double {
         (celsius - 32) * 1.8
    }
    var kelvin: Double {
         (celsius + 273.15)
    }
    init(c celsius: Double){
        self.celsius = celsius
    }
    func printTemp(){
        print("Celsius: \(celsius)")
        print("Fahrenheit: \(fahrenheit)")
        print("Kelvin: \(kelvin)")
    }
    mutating func tempUp(){
        self.celsius += 1
    }
    mutating func tempDown(){
        self.celsius -= 1
    }
}

var chitkaraTemp = Temp(c: 10)
chitkaraTemp.printTemp()
chitkaraTemp.tempUp()
chitkaraTemp.printTemp()

//struct User{
//    static var currentYear = 2025
//    var firstName:String{
//        didSet{
//            print("First Name is  \(oldValue)")
//        }
//        willSet{
//            print("First Name is changed to \(newValue)")
//        }
//    }
//    var lastName:String{
//        didSet{
//            print("Last Name is  \(oldValue)")
//        }
//        willSet{
//            print("Last Name is changed to \(newValue)")
//        }
//    }
//    var fullName:String  {
//        firstName + " " + lastName
//    }
//    var age:Int{
//        didSet{
//            print("Age is changing from  \(oldValue)")
//        }
//        willSet{
//            print("Age is changed to \(newValue)")
//        }
//    }
//    var birthYear:Int {
//        User.currentYear - age
//    }
//    init(firstName: String, lastName: String, age: Int) {
//        self.firstName = firstName
//        self.lastName = lastName
//        self.age = age
//    }
//    func printDetails(){
//        print("Full Name: \(fullName)")
//        print("Year of Birth: \(birthYear)")
//    }
//}

//var mady = User(firstName: "mady", lastName: ".", age: 20)
//mady.printDetails()
//mady.age = 21
//mady.printDetails()


class Vehicle{
    var currentSpeed = 0.0
    init(currentSpeed: Double = 0.0) {
        self.currentSpeed = currentSpeed
    }
    var description:String {
        "travelling at \(currentSpeed) miles per hour"
    }
    func makeNoise() -> String{
        return "General Vehicle has no sound!"
    }
}

class Bicycle : Vehicle{
    var hasBasket = false
    init(currentSpeed: Double = 0.0 ,hasBasket: Bool = false) {
        self.hasBasket = hasBasket;
        super.init(currentSpeed: currentSpeed)
    }
     override func makeNoise() -> String {
         "trin trin"
    }
}
class Tandem: Bicycle{
    var currentNumberOfPassengers = 0
    init(currentSpeed: Double = 0.0 ,hasBasket: Bool = false, currentNumberOfPassengers: Int = 0) {
        self.currentNumberOfPassengers = currentNumberOfPassengers
        super.init(currentSpeed: currentSpeed, hasBasket: hasBasket)
    }
}
class Train: Vehicle{
     override func makeNoise() -> String {
         "Choo Choo"
    }
}

class Car: Vehicle{
    var gear = 1
    override var description: String {
        super.description + " in gear \(gear)"
    }
    override func makeNoise() -> String {
        "ratatata"
    }
}
var tandem = Tandem()
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 20
tandem.hasBasket = true

var car = Car()


var names: [String] = ["mady", "navdeep", "harsh", "guri"]

if names.contains("mady"){
    print("\(names) contains \(names[0])")
}
print("Total Number of Names: \(names.count)")

var numbers:[Int] = []

print(numbers.max() ?? Int.min)




// MARK: - Definition of a Struct (Value Type)

/// `pointStruct` is a value type. When you assign or pass it around,
/// Swift makes a full copy. Stored in the stack (usually).
struct pointStruct {
    var x: Int
    var y: Int
}

// MARK: - Definition of a Class (Reference Type)

/// `pointClass` is a reference type. Assignments or parameters share a reference,
/// not the actual object. Stored in the heap; the reference (pointer) is on the stack.
class pointClass {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

// MARK: - Struct Example (Value Semantics)

/// When `point1Ref` is assigned from `point1`, it's a full copy.
/// Both hold separate memory locations.
var point1 = pointStruct(x: 1, y: 2)
var point1Ref = point1

// Modify `point1Ref` and it won't affect `point1` because it's a deep copy
point1Ref.x = 100

// MARK: - Class Example (Reference Semantics)

/// Both `point2` and `point2Ref` point to the same object in memory.
var point2 = pointClass(x: 1, y: 2)
var point2Ref = point2

// Modify `point2Ref` and it affects `point2` as well
point2Ref.x = 100  // point2.x is now also 100

// MARK: - Inspecting Memory Layout Using UnsafeRawPointer

/// Get a raw pointer to the object memory.
/// This points to the start of the object in the heap.
var base = UnsafeRawPointer(Unmanaged.passUnretained(point2).toOpaque())

/// Get raw pointer to the `y` property inside the object.
/// Note: `withUnsafePointer` gives us a pointer to the stack address
/// of the property wrapper (not the heap), so we're measuring offset
/// from base to this.
let yPtr = withUnsafePointer(to: point2.y) {
    UnsafeRawPointer($0)
}

/// Same for the `x` property.
let xPtr = withUnsafePointer(to: point2.x) {
    UnsafeRawPointer($0)
}

/// Compute the byte offset of `y` relative to the object base pointer.
let offset = yPtr - base
print("Offset of point2.y is \(offset) Bytes")


var array:[[Int]] = []
array.append([1,2,3])
array.append([4,5,6])

//var array2 = Array<Array<Int>>()


for i in 0..<array.count{
    for j in 0..<array[0].count{
        print(array[i][j])
    }
}

var map = [
    0 : "mady",
    1 : "harsh"
]

//var i = 0
//repeat{
//    print("hello \(i)")
//    i += 1
//}while i < 2
var i = 0
while i < 2 {
    print("hello \(i)")
    i += 1
}


var var1 = 1
var var2 = 1

print(withUnsafePointer(to: &var1){
  UnsafeRawPointer($0)
})
print(withUnsafePointer(to: &var2){
  UnsafeRawPointer($0)
})



for (index, letter) in "abcd".enumerated(){
    print("\(letter) at \(index)")
}


let test:Int? = 12

if test != nil {
    print("its not nil")
}else{
    print("its nil")
}



struct Person {
    var age: Int
    var residence: Residence?
}

struct Residence {
    var address: Address?
}
struct Address {
    var buildingNumber: String
    var streetName: String
    var apartmentNumber: String?
}

//var person = Person(age: 21)
var address = Address(buildingNumber: "4A", streetName: "Mag",apartmentNumber: "12")
var residence = Residence(address: address)
var person = Person(age: 21, residence: residence)

if let theResidence = person.residence {
    if let theAddress = theResidence.address {
        if let theApartmentNumber =  theAddress.apartmentNumber {
            print("They live in apartment number \(theApartmentNumber)")
        }
    }
}

// optional chaining
if let apartmentNumber = person.residence?.address?.apartmentNumber {
    print("They live in apartment number \(apartmentNumber)")
}









class Mentor{
    var specialization:String? = nil
    init(specialization: String?) {
        self.specialization = specialization
    }
}

class Student{
    var mentor:Mentor? = nil
    var name:String
    var age: Int
    // is the user pass a mentor instance
    init?(name:String, age:Int, mentor:Mentor?){
        if !name.isEmpty && age >= 10 {
            self.name = name
            self.age = age
            self.mentor = mentor
        }else{
            return nil
        }
    }
    // if there is not mentor instance
    init?(name:String, age:Int){
        if !name.isEmpty && age >= 10 {
            self.name = name
            self.age = age
        }else{
            return nil
        }
    }
    func getMentorSpecialization() -> String? {
        mentor?.specialization
    }
}
var mentor = Mentor(specialization: "IOS APP DEV")
var student1 = Student(name: "mady", age: 21, mentor: mentor)
var student2 = Student(name: "Guri", age: 21)

// in order to use a property or method on a failable initized instance we need to access using ?.
if let  mentorSpecialization1 = student1?.getMentorSpecialization() {
    print(mentorSpecialization1)
}else{
    print("There is not Specialization!")
}

if let  mentorSpecialization2 = student2?.getMentorSpecialization() {
    print(mentorSpecialization2)
}else{
    print("There is not Specialization!")
}

print(student2?.getMentorSpecialization() ?? "Specialization not found!")
//
//class Test{
//    var name:String
//    // there is no default initilizer you need to create one
//}
//var obj = Test(name:"mady")
//struct Test{
//    var name:String
//    // there is a default memberwise initilizer
//}
//var obj = Test(name: "mady")
//

// if a property have a default  value, it is not required to pass the property in the args of initilizer



var name:String? = "Robert"
// variable shadowing : using the name identifier after unwrapping or in the initilizer
//if let name = name {
//    // name is unwrapped here
//    print("My name is \(name)")
//}
// this is the best way to  unwrap the optional and get the same initializer
if let name {
    print("My name is \(name)")
}
// name is optional here
//print(name)
// in case of guard the unwrapped value can be accessed after the guard block
//guard let anotherName = name else{
//    print("name is nil")
//}
//print(anotherName)

// enumeration


// one way
//enum direction {
//    case up
//    case down
//    case left
//    case right
//}

// another way
enum Direction {
    case up,down,left,right
}

var direction: Direction = .right
switch(direction){
case .up:
        print("Player is going up")
case .down:
        print("Player is going down")
case .right:
    print("Player is going right")
case .left:
    print("Player is going left")
}



enum LoginStatus {
    case success, invalidUsername, invalidEmail
}
struct User{
    var username:String?
    var email:String?
    func validateUserInput() -> LoginStatus{
        guard let username , !username.isEmpty else {
            return .invalidEmail
        }
        guard let email else {
            return .invalidEmail
        }
        return .success

    }

}
var testuser = User(username: "mady020", email: "test@gmail.com")

switch(testuser.validateUserInput()){
case .invalidEmail:
    print("[ERROR] :  Either nil or Invalid Email Address!")
case .invalidUsername:
    print("[ERROR] :  Either nil or Invalid User Name!")
case .success:
    if let email = testuser.email, let username = testuser.username{
        print("Username: \(testuser.username)")
        print("Email: \(email)")
    }
}




// Type casting


class Animal{
    var name:String
    init(name: String) {
        self.name = name
    }
}
class Dog: Animal{

    func bark(){
        print("Woof!")
    }
}
class Cat: Animal {

    func meo(){
        print("Meo!")
    }
}

class Bird : Animal{
 
    func chirp(){
        print("Tweek!")
    }
}

var clients = [
    "John" : Dog(name: "Tommy"),
    "Laura" : Cat(name: "Kitty"),
    "Bob" : Bird(name: "Sparrow")
]
func getClientPet(clientName: String) -> Animal? {
    return clients[clientName]
}

let pet = getClientPet(clientName: "John") as? Dog // optionally typecasting from Animal to Dog

print(pet?.name ?? "Pet name not found!")
// pet.bark() // cannot call as the type of animal is unknown
// as! : forcefully downcast when the type is knownm this can be used with type inspection like done below

// as? : will return nil, if fail to downcast
// as!: crash the program when it fail to downcast

//if pet is Bird {
//    print("\(pet?.name ?? "") is Bird!")
//}
//if pet is Dog {
//    print("\(pet?.name) is Dog!")
//}
//if pet is Cat {
//    print("\(pet?.name) is Cat!")
//}
// is : type inspection keyword



// Any
var optionalInt:Int? = 12
var items:[Any] = [5,1.2,"string",true,  optionalInt] // Expression implicitly coerced from 'Int?' to 'Any'
let variable: Any

if let firstItem = items[0] as? Int {
    print(firstItem + 1)
}

//example: print() expects Any to be passed to the items: args
// swift shows warming when you pass an optional type like Int? to print function which expects Any
// Expression implicitly coerced from 'Int?' to 'Any'
// coerced : does something by force / explicitly

