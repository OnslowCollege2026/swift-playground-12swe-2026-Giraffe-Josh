// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() throws {
        let maxGuesses = 5
        let size = 6
        var ocean = Array(repeating: Array(repeating: "~", count: size), count: size)
        var guesses = Array(repeating: Array(repeating: "~", count: size), count: size)
        ocean[1][3] = "S"
        ocean[2][3] = "S"
        ocean[4][0] = "S"
        ocean[5][4] = "S"
        printBoard(guesses)

        var progress = 1
        while progress <= maxGuesses {
            print("Please enter row number and then column number:")
            guard let userInput = readLine(), let row = Int(userInput), let userInput2 = readLine(), let column = Int(userInput2) else {
            print("Wrong")
            continue
            }
            guesses = processGuess(row: row, col: column, ocean: ocean, guesses: guesses)
            printBoard(guesses)
            progress += 1
            }
        }
    }


func printBoard(_ board: [[String]]) {
    var columnLabels = "  "
    for i in 1...board.count {
        columnLabels = columnLabels + "\(i) "
    }
    print(columnLabels)
    
    for (index, row) in board.enumerated() {
        var rowString = "\(index + 1) "
        for cell in row {
            rowString = rowString + cell + " "
        }
        print(rowString)
    }

}

func processGuess(row: Int, col: Int, ocean: [[String]], guesses: [[String]]) -> [[String]] {
    if row >= 1, row <= ocean.count, col >= 1, col <= ocean.count {
        if guesses[row - 1][col - 1] == "O" || guesses[row - 1][col - 1] == "X" {
            print("You already did that")
            return guesses
        } else {
            if ocean[row - 1][col - 1] == "S" {
                var newGuesses = guesses
                newGuesses[row-1][col-1] = "X"
                return newGuesses
            } else {
                print("MISS")
                var newGuesses = guesses
                newGuesses[row - 1][col - 1] = "O"
                return newGuesses
            }
        }
    }
    print("NAh")
    return guesses
}

func remainingShips(in ocean: [[String]], guesses: [[String]]) -> Int {
    var shipsCount = 0
    for row in 0...ocean.count-1 {
        for col in 0...row {
            if ocean[row][col] == "S" {
                shipsCount = shipsCount + 1
            }
        }
    }
    
    var hitCount = 0
    for row in 0...guesses.count-1 {
        for col in 0...row {
            if guesses[row][col] == "X" {
                hitCount = hitCount + 1
            }
        }
    }
    
    return shipsCount - hitCount
}
