//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var count = 0
func solveQueens(board: inout Board) {
	if solveQueensHelper(board: &board, col: 0){
		print(board)
	}
}

func solveQueensHelper(board: inout Board, col: Int) -> Bool{
	count += 1
	
	// base case
	if col >= board.size {
		return true
	}
	
	for i in 0..<board.size{
		if board.isSafe(row: i, col: col){
			board.place(row: i, col: col)
			
			if solveQueensHelper(board: &board, col: col + 1){
				return true
			} else {
				board.remove(row: i, col: col)
			}
		}
	}
	return false
}

//board.isSafe(row: 0, col: 0)
//board.place(row: 0, col: 0)
//board.remove(row: 0, col: 0)

// MARK: quick way to find one solution

func solve8QueenOneWay(board: inout Board) {
	var nonFilledRows = [0,1,2,3,4,5,6,7]
	if solve8QueenOneWayHelper(board: &board, col: 0, nonFilledRows: &nonFilledRows ){
		print(board)
	}
}

private func solve8QueenOneWayHelper(board: inout Board, col: Int, nonFilledRows: inout [Int]) -> Bool{
	count += 1
	
	// base case
	if col >= 8 {
		return true
	}
	
	for i in nonFilledRows {
		if board.isSafe(row: i, col: col){
			board.place(row: i, col: col)
			nonFilledRows = nonFilledRows.filter { $0 != i }
			if solve8QueenOneWayHelper(board: &board, col: col + 1, nonFilledRows: &nonFilledRows){
				return true
			} else {
				nonFilledRows.append(i)
				board.remove(row: i, col: col)
			}
		}
	}
	return false
}
