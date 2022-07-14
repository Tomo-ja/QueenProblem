//
//  ExhaustiveSearch.swift
//  SwiftAGDS
//
//  Created by Tomonao Hashiguchi on 2022-07-13.
//

import Foundation

func printBinaryExhaustive(_ n: Int) {
	printBinaryExhaustiveHelper(n, soFar: "")
}

private func printBinaryExhaustiveHelper(_ n: Int, soFar: String) {
	if n == 0 {
		// no more digits to choose
		print(soFar)
	} else {
		// for each availabe choices (0 or 1)
		for i in 0...1 {
			printBinaryExhaustiveHelper(n-1, soFar: soFar + "\(i)")
		}
	}
}

func printDecimal(_ n: Int) {
	printDecimalHelper(n, soFar: "")
}
private func printDecimalHelper(_ n: Int, soFar: String) {
	if n == 0 {
		print(soFar)
	} else {
		for i in 0...9 {
			printDecimalHelper(n - 1, soFar: soFar + "\(i)")
		}
	}
}

func printPermutation(_ word: String) {
	printPermutaionHelper(word, soFar: "")
}
private func printPermutaionHelper(_ word: String, soFar: String) {
	if word.count == 0 {
		print(soFar)
	} else {
		for i in 0..<word.count {
			let c = word[i]
			printPermutaionHelper(word[0, i] + word[i + 1, word.count], soFar: soFar + "\(c)")
		}
	}
}

func rollDice(_ n: Int) {
	var choises = [Int]()
	rollDiceHelper(n, choices: &choises)
}
private func rollDiceHelper(_ n: Int, choices: inout [Int]) {
	if n == 0 {
		print(choices)
	} else {
		for i in 1...6 {
			choices.append(i)
			rollDiceHelper(n - 1, choices: &choices)
			choices.removeLast()
		}
	}
}
