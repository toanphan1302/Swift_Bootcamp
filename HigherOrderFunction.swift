var information = ["Barry" : 10,
                   "Tom"   : 20,
                   "Ren"   : 15,
                   "Brian" : 19,
                   "Aline" : 27 ]


var sortedNames = information.keys.sorted{$0<$1}
print("Sorted Names: \(sortedNames)")

var sortedInfo : [String : Int] = [ : ]
for name in sortedNames {
    sortedInfo[name] = information[name]
}
print("Sorted Inormation: \(sortedInfo)")
// DICTIONARY CANNOT BE SORTED

let teenrange = 11 ..< 20
var teen = information.filter {teenrange.contains($0.value) }
print("Teen: \(teen)")

var date = [07,21,2021]
var stringDate = date.reduce(""){ (result, a) -> String in
    return result + ("/\(String(a))")
}

print ("Date: \(stringDate)")
// use remove instead of drop for string
stringDate.removeFirst(1)
print ("Date after drop: \(stringDate)")

var numbers = [100,52,45,22,49,36,78]

var sum = numbers.map{$0 + numbers.count}
print (sum)