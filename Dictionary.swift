var numbers = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2]
// find frequency of the array of integer

var frequency: [Int:Int] = [:] // [the numbers : how manny times it appear in the array]

for i in stride(from: 0, to: numbers.count, by:1){
    var count = 0
    for j in stride(from: 0, to: numbers.count, by:1){
        if (numbers[i] == numbers[j]) {
            count += 1
        }
       
    }
    if (frequency[numbers[i]] == nil){
        frequency[numbers[i]] = count
    }
}

print(numbers)    
print(frequency)

print(frequency.keys.contains(1))

var a = frequency.keys.first(where: {$0 >2} )
print(a)