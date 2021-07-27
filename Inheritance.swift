class Person{
    var name = "Unknown"
    var height = [0,0]
    var weight = 0.0
    var age = 0.0
    var description: String{
        return "\(name) is \(age) years old;\n\(height[0]) ft'\(height[1]), weights \(weight) lbs"
    }
    func action() {
        //do nothing
    }
}
class Adult: Person{
    var job = "jobless"
    var income = 0.0
    override var description: String{
        return super.description+"\nworks as a \(job) and making $\(income) a year"
    }
    override func action() {
        print("\(super.name) goes to work every weekday")
    }
}

class richPerson: Adult{
    override var age: Double{
        didSet{
            income = age * 100000 
        }
    }
}

var realEstateAgent = richPerson()
realEstateAgent.name = "Ben"
realEstateAgent.height = [5,10]
realEstateAgent.weight = 160.0
realEstateAgent.age = 35.0
realEstateAgent.job = "Real Estate Agent"

print(realEstateAgent.description)
realEstateAgent.action()
