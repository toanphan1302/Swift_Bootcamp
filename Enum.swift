enum User : String {
    case boss, developer, accountant, guest, employee
}



let newUser = "developer"

if let someUser = User(rawValue : newUser){
    switch someUser {
        case .boss,
             .developer:
        print ("\(newUser) can access anything")
        case .accountant:
        print ("\(newUser) can access finance information")
        case .employee:
        print ("\(newUser) can access personal information")
        default:
        print("\(newUser) can acess guest information")
    }
} else {
    print ("\(newUser) is not on the system")
}




var anotherUser = User(rawValue : newUser)
print (anotherUser == User.boss || anotherUser == User.developer)
