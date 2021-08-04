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


// Test CanDoMath
var myComplex = ImaginaryNumber(real: 1, img: 3)
var anotherComplex = ImaginaryNumber(real: 4.0, img: 6.0)
print("Testing Variables: ")
myComplex.describe()
anotherComplex.describe()

print("Test minus: ")
(myComplex - anotherComplex).describe()
print("Test add: ")
(myComplex + anotherComplex).describe()
print("Test multiply: ")
(myComplex * anotherComplex).describe()
print("Test devide: ")
(myComplex / anotherComplex).describe()

// Using Extension with Hasable

extension ImaginaryNumber: Hashable {
    func hash(into hasher: inout Hasher){
        hasher.combine(real)
        hasher.combine(img)
    }
}

var complexSet: Set = [ImaginaryNumber(real: 2, img: 3),ImaginaryNumber(real: 4, img: 5)]
let randomComplex = ImaginaryNumber(real: 1, img: 7)
if complexSet.contains(randomComplex){
    print("Already have ")
    randomComplex.describe()
} else{
    complexSet.insert(randomComplex)
    print("New complex added to set:")
    randomComplex.describe()
}
