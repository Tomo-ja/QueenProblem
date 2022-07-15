//
//  main.swift
//  SwiftAGDS
//
//  Created by Tomonao Hashiguchi on 2022-07-11.
//

import Foundation

var boardForAllWay = Board(size: 8)
var boardForQuick = Board(size: 8)

solveQueens(board: &boardForAllWay)
print("There are \(ways) ways to resolve on \(boardForAllWay.size)x\(boardForAllWay.size)size of a board")
print("------------------------------------------")

solve8QueenOneWay(board: &boardForQuick)
print("Number of recursive calls: \(count)")
