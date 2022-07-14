//
//  main.swift
//  SwiftAGDS
//
//  Created by Tomonao Hashiguchi on 2022-07-11.
//

import Foundation

// MARK: homework 3
//printBinary(-15)
//print("")
//printBinary(15)
//print("")

// MARK: homework 4
//reverseLines(try! String(contentsOfFile: "/Users/Tomo/Desktop/ciccc/mobile/SwiftAGDS/SwiftAGDS/Recursion/story.txt"))

// MARK: homework 5

//print(evaluate("7"))
//print(evaluate("(2+2)"))
//print(evaluate("(1+(2*4))"))
//print(evaluate("((1+3)+((1+2)*5))"))
//print(evaluate("(((1+2)*5)+(1+3))"))
//print(evaluate("((4+((1+2)*5))+((1+3)+(1+3)))"))

// MARK: exhaustive search

//printBinaryExhaustive(2)

//printDecimal(2)

//printPermutation("tom")
//
//rollDice(2)
//rollDiceSum(2, 12)

var board = Board(size: 8)

solve8QueenOneWay(board: &board)
print(count)
