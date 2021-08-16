import UIKit

protocol CanDoMath {
    static func + (lhs: Self,rhs: Self) ->Self
    static func - (lhs: Self,rhs: Self) ->Self
    static func * (lhs: Self,rhs: Self) ->Self
    static func / (lhs: Self,rhs: Self) ->Self
}
class ImaginaryNumber: CanDoMath{
    var real = 0.0
    var img = 0.0
    init<T> (real: T, img: T) {
        if let doubleReal = real as? Double, let doubleImg = img as? Double{
            self.real = doubleReal
            self.img = doubleImg
        }
        else if let intReal = real as? Int, let intImg = img as? Int{
            self.real = Double(intReal)
            self.img = Double(intImg)
        }else{
            print("not a number please enter a number")
        }
        }
    func describe () {
        if self.img >= 0 {
            print ("\(real) + \(img)i")
        }else {print ("\(real)  \(img)i")}
    }

    static func - (lhs: ImaginaryNumber,rhs: ImaginaryNumber) -> Self {
        let result = ImaginaryNumber(real: lhs.real - rhs.real, img: lhs.img - rhs.img)
        return result as! Self
    }
    static func + (lhs: ImaginaryNumber, rhs: ImaginaryNumber) -> Self {
        let result = ImaginaryNumber(real: lhs.real + rhs.real, img: lhs.img + rhs.img)
        return result as! Self
    }
    
    static func * (lhs: ImaginaryNumber, rhs: ImaginaryNumber) -> Self {
        let newA = lhs.real * rhs.real - lhs.img * rhs.img
        let newB = lhs.real * rhs.img + lhs.img * rhs.real
        return ImaginaryNumber(real: newA, img: newB)as! Self
    }
    
    static func / (lhs: ImaginaryNumber, rhs: ImaginaryNumber) -> Self {
        let denum = rhs.real * rhs.real + rhs.img * rhs.img
        let num = lhs * (rhs.conjugate())
        return ImaginaryNumber(real: num.real/denum, img: num.img/denum) as! Self
    }
    

    func conjugate () -> ImaginaryNumber{
        return ImaginaryNumber(real: self.real, img: -self.img)
    }
    // no need to mutating in class
    func conjugated () {
        self.img = -self.img
    }
    // self / b

    static func == (a: ImaginaryNumber,b: ImaginaryNumber) -> Bool {
        return a.real == b.real && a.img == b.img
    }
}

// Testing value type and reference type
var someComplex = ImaginaryNumber(real: 1, img: 1)
var myComplex = ImaginaryNumber(real: 1, img: 1)
print("\(someComplex === myComplex)")
var anotherComplex = someComplex
someComplex.describe()
anotherComplex.conjugated()
someComplex.describe()
var myDouble = 1.1
var anotherDouble = myDouble
anotherDouble = 0.5
print(myDouble)


// Deinit
class Queue {
    var queueLength = 0
    func receive(_ number: Int) {
        queueLength  += number
    }
    func leave(_ number: Int) {
        queueLength -= number
    }
}

class GroupOfPlayer {
    var inQueue: Queue?
    var numberOfPlayer = 0
    init(numberOfPlayer: Int, queueName: Queue?){
        self.numberOfPlayer = numberOfPlayer
        self.inQueue = queueName
        inQueue?.receive(numberOfPlayer)
    }
    deinit{
        inQueue?.leave(numberOfPlayer)
    }
}

var myQueue = Queue()
print("New queue has: \(myQueue.queueLength) player")
var newPlayerGroup: GroupOfPlayer? = GroupOfPlayer(numberOfPlayer: 3, queueName: myQueue)
print("Queue now has: \(myQueue.queueLength) players")
newPlayerGroup = nil
print("The group has left the queue")
print("Queue now has: \(myQueue.queueLength) players")



