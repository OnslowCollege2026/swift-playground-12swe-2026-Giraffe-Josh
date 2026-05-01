// The Swift Programming Language
// https://docs.swift.org/swift-book

//The function to record a sale
func recordSale(currentStock: Double, currentBagStock: Double, costOfKumara: Double, bagCost: Double) -> [[Double]] {
    let isRunning = true
    while isRunning == true {
    print("How many kilograms of kumara is being sold?")
    //BIG ERROR!! fix later
    if let userInput = readLine(), let kgsSold = Double(userInput), kgsSold < currentStock, kgsSold > 0 {
        print("And how many bags are being used?")
        if let userInput = readLine(), let bagsSold = Double(userInput), bagsSold < currentBagStock, bagsSold > 0 {
            let totalCost = (kgsSold * costOfKumara) + (bagsSold * bagCost)
            print("\(kgsSold) kgs of kumara are being sold in \(bagsSold) number of bags. This makes the total cost: $\(totalCost)")
            let newStock = currentStock - kgsSold
            if newStock <= 0 {
                let salesThings = [
                    [kgsSold],
                    [bagsSold],
                    [totalCost]
                    ]
                return salesThings
            }
        }
        }
    }
}

//to find the totals of rows in a 2d array.
func rowTotal(in matrix: [[Double]], row: Int) -> Double {
    guard row >= 0 && row < matrix.count else { return 0 }
    return matrix[row].reduce(0, +)
}
/// A description
@main
struct SwiftPlayground {
    static func main() {
        ///Creating the variables to be used in code later.
        let kumaraCostPerKg = 3.0
        let bagCost = 0.20
        var kumaraStockInKg = 0.0
        var kumaraStock = kumaraStockInKg * 10
        let maximumStock = 50.0
        var numberOfBags = 5000.0
        var recordOfSales: [[Double]] = []
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
                    print("How many kgs would you like to add?")
                    if let userInput = readLine(), let addedKumara = Double(userInput), addedKumara > 0, addedKumara <= maximumStock - kumaraStockInKg {
                        kumaraStock = kumaraStock + addedKumara
                        print("You have added \(addedKumara) kilograms of kumara and now have \(kumaraStockInKg) kilograms of kumara")
                    } else {
                        print("Invalid input")
                    }
                //Allowing user to view the stock if it pleases them.
                } else if userChoice == 2 {
                    print("You currently have \(kumaraStock) kumara (\(kumaraStockInKg) kgs)")
                //Permitting the user to record a sale if it tickles their fancy.
                } else if userChoice == 3 {
                    if kumaraStock > 0 {
                    let recordedSale = recordSale(currentStock: kumaraStockInKg, currentBagStock: numberOfBags, costOfKumara: kumaraCostPerKg, bagCost: bagCost)
                    kumaraStockInKg = kumaraStockInKg - recordedSale[0][0]
                    numberOfBags = numberOfBags - recordedSale[1][0]
                    recordOfSales[0].append(contentsOf: recordedSale[0])
                    recordOfSales[1].append(contentsOf: recordedSale[1])
                    recordOfSales[2].append(contentsOf: recordedSale[2])
                    print("You just recorded a sale i guess")
                    } else {
                        print("You got nothing to sell cabron")
                    }
                //Allowing the user to view sales records
                } else if userChoice == 4 {
                print(recordOfSales)
                //Showing the user all of the infos
                } else if userChoice == 5 {
                    let totalKgsSold = rowTotal(in: recordOfSales, row: 0)
                    let totalBagsSold = rowTotal(in: recordOfSales, row: 1)
                    let totalEarnings = rowTotal(in: recordOfSales, row: 2)
                    let averageKgsPerBag = totalKgsSold / totalBagsSold
                    print("You have sold a total of \(totalKgsSold) kgs of kumara")
                    print("These were sold in a total of \(totalBagsSold) bags. This means that on average, you sold \(averageKgsPerBag) kgs per bag.")
                    print("You also made $\(totalEarnings)")
                //Ending the loop if the user chooses to do so.
                } else if userChoice == 6 {
                    print("Thank you for using the programme.")
                    menuRunning = false
                }
            }
        }
}
}





//it is so joever