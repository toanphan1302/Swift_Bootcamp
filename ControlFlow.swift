let names = ["Yo","Brian","Chance","Ben"]
for name in names {
    if name.count <= 3{
        print ("\(name) has less than 3 letter")
    }
}

print("Even Numbers:")
for number in stride(from: 0, through:12, by:2){
    print(number)
}

var i = 0
repeat{
    print("the loop is repeating")
    i+=1
} while (i < 10)

for name in names{
    switch name[name.startIndex]{
        case "Y":
        print("\(name) starts with Y")
        case "B":
        print("\(name) starts with B")
        case "C":
        print("\(name) starts with C")
        default:
        break
    }
}