// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        
func menuOptions() {
    print("===Egg Shop===")
    print("1. Add eggs")
    print("2. Sell eggs")
    print("3. Show stock")
    print("4. Show total sold")
    print("5. Exit")
    let userInput = Int(readLine()!)!
        if userInput == 1 { 
            addEggs()
        } else if userInput == 2 {
            sellEggs()
        } else if userInput == 3 {
            print(eggStock)
        } else if userInput == 4 {
            print(eggSold)
        } else if userInput == 5 {
            inMenu = false
        }
    }

func addEggs() {
    print("Enter number of eggs to add:")
    let userInput2 = Int(readLine()!)!
    if userInput2 > 0 {
        if userInput2 < 1000 - eggStock {
            eggStock += userInput2
        } else {
            print("INVALID")
        }
    } else {
        print("INVALID")
    }
}
func sellEggs() {
    print("Please enter number of eggs to be sold:")
    let userInput2 = Int(readLine()!)!
    if userInput2 < eggStock {
        if userInput2 > 0 {
            eggStock -= userInput2
            eggSold += userInput2
        } else {
            print("Invalid!! KYS!")
        }
    } else {
        print("INVALID")
    }
}

        var inMenu = true
        var eggStock = 0
        var eggSold = 0
        while inMenu == true {
            menuOptions()
        }
    }
}
