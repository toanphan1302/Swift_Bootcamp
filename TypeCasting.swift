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

// extension
extension ImaginaryNumber: Hashable {
    func hash(into hasher: inout Hasher){
        hasher.combine(real)
        hasher.combine(img)
    }
}


extension Double {
    var complex: ImaginaryNumber {return ImaginaryNumber(real: self, img: 0)}
    func toRad() -> Double{
        return self * .pi / 180.0
    }
}
extension Int {
    var complex: ImaginaryNumber {return ImaginaryNumber(real: self, img: 0)}
}


extension ImaginaryNumber {
    convenience init (radius: Double, angle: Double) {
        self.init(real: (radius * cos(angle.toRad())), img: (radius * sin(angle.toRad())))
    }
}

var int: Int = 8
var numbers: [Any] = []
numbers.append(ImaginaryNumber(radius: 1.0, angle: 45.0))
numbers.append(32.5)
numbers.append(19)
numbers.append("Three")
numbers.append(-20.7)
numbers.append(int)
numbers.append(ImaginaryNumber(real: sqrt(2.0), img: sqrt(2.0)))
numbers.append("Not a number")
numbers.append("Zero")
numbers.append((ImaginaryNumber(real: 1, img: 1), 22.8))
numbers.append(0)

for number in numbers {
    switch number {
    case let someString as String:
        switch someString {
        case "Three":
            print("number 3 as String")
        case "Not a number":
            print("Nothing")
        case "Zero":
            print("Zero as String")
        default:
            break
        }
    case is Int:
        print("I know this is Int but cannot print the value")
    case let someInt as Int:
        print("Int value: \(someInt)")
//    case ImaginaryNumber(real: sqrt(2.0), img: sqrt(2)): error
//        print()
    case 0 as Int:
        print("printing 0")
    case let someInt as Int where someInt > 0:
        print("\(someInt) > 0")
    case let someComplex as ImaginaryNumber:
        someComplex.describe()
    case let (x,y) as (ImaginaryNumber, Double):
        print("Adding Double and Complex: ")
        x.describe()
        print("+ \(y) = ")
        (x + y.complex).describe()
    case let someDouble as Double where someDouble < 0:
        print("Negative number: \(someDouble)")
    default:
        print("I dont want to print this")
    }
}

