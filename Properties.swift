struct Point {
    var x = 0.0, y = 0.0
}
struct Circle {
    var center = Point()
    var radius = 0.0
    var area : Double {
        get{
            return 3.14 * radius * radius
        }
        set(newArea) {
            radius = (newArea / 3.14).squareRoot()
            }
    }
    lazy var description = "Circle center at \(center), has radius of \(radius) and \(area) in area"
    var equation : String { 
        get{
            return "(x - \(center.x))^2 + (y - \(center.y))^2 = \(radius * radius)"}
        }
}

var myCircle = Circle()
myCircle.center = Point(x: 2.0, y: 5.0)
myCircle.radius = 4
print(myCircle.description)
print(myCircle.equation)

myCircle.area = 20.0
// description will not change value because there is no get function for the variable
print(myCircle.description)
print(myCircle.equation)


