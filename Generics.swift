//Testing generics with class and functions

class ImaginaryNumber{
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
    // self - b
    func subtraction (_ b: ImaginaryNumber) -> ImaginaryNumber{ 
        return ImaginaryNumber(real: (self.real - b.real), img: (self.img - b.img))
    }
    func addition (_ b: ImaginaryNumber) -> ImaginaryNumber{
        return ImaginaryNumber(real: (self.real + b.real), img: (self.img + b.img))
    }
    func multiply (_ b: ImaginaryNumber) -> ImaginaryNumber{
        let newA = self.real * b.real - self.img * b.img
        let newB = self.real * b.img + self.img * b.real
        return ImaginaryNumber(real: newA, img: newB)
    }
    func conjugate () -> ImaginaryNumber{
        return ImaginaryNumber(real: self.real, img: -self.img)
    }
    // no need to mutating in class
    func conjugated () {
        self.img = -self.img
    }
    // self / b
    func divide (_ b: ImaginaryNumber) -> ImaginaryNumber{
        let denum = b.real * b.real + b.img * b.img
        let num = self.multiply(b.conjugate())
        return ImaginaryNumber(real: num.real/denum, img: num.img/denum)
    }
    static func == (a: ImaginaryNumber,b: ImaginaryNumber) -> Bool {
        return a.real == b.real && a.img == b.img
    }
}

var myComplex = ImaginaryNumber(real: 3.0, img: 4.0)
myComplex.describe()
var newComplex = myComplex.conjugate()
print("Conjugate function: ")
newComplex.describe()
newComplex.conjugated()
print("Test conjugated function: ")
newComplex.describe()
print("\n\n\n")
// testing +-*/
var anotherComplex = ImaginaryNumber(real: 2.0, img: 5.0)
print("Another Complex to Test with:")
anotherComplex.describe()
let sub = myComplex.subtraction(anotherComplex)
print("Test subtraction:")
sub.describe()
let add = myComplex.addition(anotherComplex)
print("Test addition:")
add.describe()
let mul = myComplex.multiply(anotherComplex)
print("Test multiply:")
mul.describe()
let div = myComplex.divide(anotherComplex)
print("Test divide:")
div.describe()


// Test generics
print("\n\n\n\n")
print("Testing Generics: ")
print("String Init:")
myComplex = ImaginaryNumber(real: "not Real", img: "not Img")
print("Int Init: ")
myComplex = ImaginaryNumber(real: 1, img: 2)
myComplex.describe()
print("Testing equal: ")
print(myComplex == myComplex)

func findIndexes<T: Comparable>(lessthan value: T, in array:[T]) -> [Int]? {
    var outArray: [Int] = []
    for (index, anyValue) in array.enumerated() {
        if anyValue < value {
            outArray += [index]
        }
    }
    if outArray.isEmpty {
        return nil
    } else {return outArray}
}

var stringArray = ["Mama","Baba","Baby"]
print(findIndexes(lessthan: "K", in: stringArray))
var numberArray = [1.1,2.3,5.6,10.1]
print(findIndexes(lessthan: 5, in: numberArray))
// var complexArray = [myComplex,newComplex,anotherComplex]
// print(findIndexes(lessthan: ImaginaryNumber(real: 1, img: 5), in: complexArray))

