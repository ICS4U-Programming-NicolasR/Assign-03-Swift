// Pow4SumDigits.swift
//
//  Created by Nicolas Riscalas
//  Created on 2023-05-07
//  Version 1.1
//  Copyright (c) 2023 Nicolas Riscalas. All rights reserved.
//
//  Does the assignment 3 problem

import Foundation

// Define a function to find out if a number is to the power of 4
func powerOfFour(_ num: Int, _ multipleOfFour: Int = 4) -> Bool {
   // if it is return true
    if multipleOfFour == num {
        return true
    } else if multipleOfFour > num {
        // otherwise return false
        return false
    } else {
        // if incomplete calculate further
        return powerOfFour(num, multipleOfFour * 4)
    }
}

// define a function to find out the sum of all of the digits
func sumOfDigits(_ index: Int, _ stringNums: [String]) -> Int {
    // base case
    if index >= stringNums.count {
        return 0
    } else {
        // convert the number to int
        if let number = Int(stringNums[index]) {
            return sumOfDigits(index + 1, stringNums) + number
        } else {
            // Handle the case when the conversion fails
            return sumOfDigits(index + 1, stringNums)
        }
    }
}
// base function of sumOfDigits
func sumOfDigits(_ num: Int) -> Int {
    let stringNum = String(num)
    print(stringNum)
    return sumOfDigits(0, Array(stringNum).map { String($0) })
}

// Define input and output file paths
let inputFilePath = "input.txt"
let outputFilePath = "output.txt"

// Read input from file
if let inputString = try? String(contentsOfFile: inputFilePath) {
    // Separate the input into lines
    let inputLines = inputString.components(separatedBy: .newlines)

    // Calculate power of 4 and sum of digits for each line and append to answers array
    var answers = [String]()
    for line in inputLines {
        if let num = Int(line) {
            let sum = sumOfDigits(num)
            let powerOfFour = powerOfFour(num)
            // append to the answers array
            let resultString = "The sum of all of the digits of \(num) is \(sum)"
            var powerString = ""
            if powerOfFour {
                powerString = "\(num) is a power of four"
            } else {
                powerString = "\(num) is not a power of four"
            }
            answers.append(resultString)
            answers.append(powerString)
        }
    }

    // Write output to file
    let outputString = answers.joined(separator: "\n")
    do {
        try outputString.write(toFile: outputFilePath, atomically: true, encoding: .utf8)
    } catch {
        print("Error writing to file: \(error)")
    }
} else {
    print("Error reading input file.")
}
