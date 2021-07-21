var myString = """
    This is my string,
    It has two line!
"""
print(myString)
//index = 
//var newString = myString[myString.firstIndex.rawValue]

//print(newString)
let range = myString.index(myString.endIndex, offsetBy: -6)..<myString.endIndex

var newString = myString[range]
print(newString)
print("Range = ", range)

//this can just insert an character, not a string
// insert string with 
//insert(contentsOf: "string", at: index)
myString.insert("?", at: myString.index(myString.startIndex, offsetBy: 2))
print("myString after insert:", myString)

//replaceSubrange

myString.replaceSubrange(range, with: "what?")
print("myString after replaceSubrange" , myString)



print("a" < "b")
print("myString.contains('n') ",myString.contains("n"))