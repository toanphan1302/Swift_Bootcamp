
func convolution(signal1: [Int], signal2: [Int] ) -> Array<Int>{
    //var reversesignal = signal2
    var outsignal = Array(repeating: 0, count: signal1.count * 2)
    for i in stride(from: 0, through:signal1.count-1, by:1){0
        for j in stride(from: 0, through:i, by:1){
            outsignal[i] += signal1[j] * signal2[i-j]            
        }
        for j in stride(from: 1, through:signal1.count-i-1, by:1){
            outsignal[i+signal1.count] += signal2[signal1.count-j] * signal1[j+i]            
        }
        
    }
    
    return outsignal
}

var testsignal = [1,1,1,1,1,1,1,1,1]
print("Convolution Result: ")
print(convolution(signal1: testsignal,signal2: testsignal))

// var signal1=[1, 1, 1, 1, 1, 1, 1]
// print(signal1.count)
// var number = signal1.count
// var outsignal = Array(repeating: 0, count: signal1.count*2)
// print(outsignal)
// // for i in stride(from: 0, through:signal1.count, by:1){
// //     print(i)
// // }
// signal1=[0, 1, 2, 3, 4, 5, 6]

//     for i in stride(from: 0, through:signal1.count-1, by:1){
//         for j in stride(from: 0, through:i, by:1){
//             print("i = \(i)")
//             print("j = \(j)")
//             print("signal1[j] = \(signal1[j])")
//             print("signal1[i-j] = \(signal1[i-j])")
//             // outsignal[i] += signal1[j] * signal2[i-j]
//             // outsignal[i+signal1.count] += signal1[j+1] * signal2[signal1.count-j-1]
//         }
//     }

testsignal = [0,1,2,3,4,5,6,7,8,9]
var max  = testsignal.max()
print("Max = \(max)")
print("dropFirst= \(testsignal.dropFirst(2))")
print("enumerated= \(testsignal.enumerated())")
testsignal.reverse()
print("reverse= \(testsignal)")
print("shuffled= \(testsignal.shuffled())")
testsignal.sort()
print("sort= \(testsignal)")