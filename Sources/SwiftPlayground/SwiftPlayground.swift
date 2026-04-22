// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        ///Creating the variables to be used in code later.
        var kumaraStock = 0
        var kumaraStockInKg = kumaraStock / 10
        var maximumStock = 500
        var numberOfBags = 5000
        //Using a variable and while loop to run a menu of choices for the stall owner.
        var menuRunning = true
        while menuRunning == true {
            //Printing the options and prompting the user to choose one.
            print("What would you like to do?")
            print("1. Add to stock")
            print("2. View stock")
            print("3. Record a sale")
            print("4. View sales records")
            print("5. Show summary of sales")
            print("6. Exit")
            //Taking the users choice
            if let userInput = readLine(), let userChoice = Int(userInput) {
                //Allowing the user to add to stock should they so choose.
                if userChoice == 1 {
                    print("You currently have \(kumaraStock) kumara (\(kumaraStockInKg) kgs)")
                    print("How many would you like to add?")
                    if let userInput = readLine(), let addedKumara = Int(userInput), addedKumara > 0, addedKumara <= maximumStock - kumaraStock {
                        kumaraStock = kumaraStock + addedKumara
                        print("You have added \(addedKumara) kumara and now have \(kumaraStock) kumara")
                    } else {
                        print("Invalid input")
                    }
                //Allowing user to view the stock if it pleases them.
                } else if userChoice == 2 {
                    print("You currently have \(kumaraStock) kumara (\(kumaraStockInKg) kgs)")
                //Permitting the user to record a sale if it tickles their fancy.
                } else if userChoice == 3 {
                    
                //Ending the loop if the user chooses to do so.
                } else if userChoice == 6 {
                    print("Thank you for using the programme.")
                    menuRunning = false
                }
            }
        }
}
}