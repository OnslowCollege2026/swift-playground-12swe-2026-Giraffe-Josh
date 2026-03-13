// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        //task a

        let temperatures: [[Int]] = [
            [14,31,24,23],
            [0,-1,5,10],
            [45,36,20,13]
        ]
        //full first row
        print(temperatures[0])
        //row 2 column 3
        print(temperatures[1][2])
        //row 3 column 1
        print(temperatures[2][0])
        //average row 1
        var average = 0
        temperatures[0].forEach { temperature in 
            average += temperature
        }
        average = average / temperatures[1].count
        print(average)

        //task b

        let table = [
            [2,4,6],
            [8,10,12],
            [14,16,18]
        ]
        table.forEach {row in
        row.forEach {value in 
        print(value)}}

        //task c

        let table2 = [
    [3, 5, 7, 9],
    [2, 4],
    [8, 6, 1],
    [10]
]
    columnTotal(in: table2, column: 1)
    }
}

func columnTotal(in table: [[Int]], column: Int) {
    var counter = 0
    for row in table {
        if row.count > column {
            counter = counter + row[column]
        }
    }
    print(counter)
}
