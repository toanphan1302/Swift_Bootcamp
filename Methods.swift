class ImaginaryNumber {
    var real = 0.0
    var img = 0.0
    init (real: Double, img: Double){
        self.real = real
        self.img = img
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





