struct CookiePackage {
    var cookieSize = 4
    var hasChocolate = true
    var numberOfCookie: Int = 0
}
protocol BakeryDelegate {
    func cookieWasBaked(_ cookiePackage: CookiePackage)
}
protocol CookieChain {
    var cookiePackage: CookiePackage{get}
}
class Bakery:CookieChain{
    
    var cookiePackage = CookiePackage(cookieSize: 0, hasChocolate: true, numberOfCookie: 0)
    var bakeryDelegate: BakeryDelegate?
    func makeCookie(){
        self.cookiePackage.cookieSize = 5
        self.cookiePackage.numberOfCookie = 12
        
        bakeryDelegate?.cookieWasBaked(cookiePackage)
    }
}
protocol CookieShopDelegate{
    func cookieWasShihpped(_ cookiePackage: CookiePackage)
}

class CookieShop: BakeryDelegate, CookieChain{
    var cookiePackage = CookiePackage(cookieSize: 0, hasChocolate: true, numberOfCookie: 0)
    var cookieShopDelegate: CookieShopDelegate?
    
    func cookieWasBaked(_ cookiePackage: CookiePackage) {
        print("Cookie package was baked, with size \(cookiePackage.cookieSize) and has \(cookiePackage.numberOfCookie) cookies")
         self.cookiePackage = cookiePackage
    }
     
    func shipCookie() {
        
        cookieShopDelegate?.cookieWasShihpped(self.cookiePackage)
    }
}

class Customer: CookieShopDelegate, CookieChain{

    
   var cookiePackage = CookiePackage(cookieSize: 0, hasChocolate: true, numberOfCookie: 0)
   func cookieWasShihpped(_ newCookiePackage: CookiePackage) {
    print("Cookie package containing \(newCookiePackage.numberOfCookie) cookies, with cookie size of \(newCookiePackage.cookieSize) has been shipped")
    self.cookiePackage = newCookiePackage
   }
}


var newBakery = Bakery()
var newShop = CookieShop()
var newCustomer = Customer()
newBakery.bakeryDelegate = newShop
newShop.cookieShopDelegate = newCustomer
print("Before cookies made: ")
print("Cookies in bakery: \(newBakery.cookiePackage.numberOfCookie)")
print("Cookies in shop: \(newShop.cookiePackage.numberOfCookie)")
print("Customer has: \(newCustomer.cookiePackage.numberOfCookie) cookie")
newShop.shipCookie()

print("After making cookies but before shipped: ")
newBakery.makeCookie()
print("Cookies in bakery: \(newBakery.cookiePackage.numberOfCookie)")
print("Cookies in shop: \(newShop.cookiePackage.numberOfCookie)")
print("Customer has: \(newCustomer.cookiePackage.numberOfCookie) cookie")

print("After cookies are made and shipped: ")
newShop.shipCookie()
print("Cookies in bakery: \(newBakery.cookiePackage.numberOfCookie)")
print("Cookies in shop: \(newShop.cookiePackage.numberOfCookie)")
print("Customer has: \(newCustomer.cookiePackage.numberOfCookie) cookies")

