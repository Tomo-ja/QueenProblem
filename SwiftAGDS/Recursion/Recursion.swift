//
//  Recursion.swift
//  SwiftAGDS
//
//  Created by Tomonao Hashiguchi on 2022-07-11.
//

import Foundation

// 1. power(base, exponent): base^exponent
// assume exponent >= 0
func power(base: Int, exponent: Int) -> Int {
  assert(exponent >= 0)
  // base case
  if exponent == 0 { return 1 }
  // recursive case
  return base * power(base: base, exponent: exponent - 1)
}
// 2. isPalindrome(word): checks if a word is palindrome
func isPalindrome(_ word: String) -> Bool {
  // base case
  if word.count <= 1 { return true }
  // recursive case
  if word[0] == word[word.count - 1] {
	return isPalindrome(word[1, word.count - 1])
  }
  return false
}

// Homework  , padding: String
// 3. printBinary(n): prints binary form of given int
var printBinaryHelper = ""

func printBinary(_ n: Int) {
  // base case
	if abs(n) < 2 {
		print(printBinaryHelper, terminator: "")
		printBinaryHelper = "" // reset sign for next time function's called
		print(n, terminator: "")
	}
  // recursive case
	else {
		if n < 0 {
			printBinaryHelper = "-"
		}
		printBinary(abs(n) / 2)
		print(abs(n) % 2, terminator: "")
	}
}

// Homework
// 4. reverseLines
// - Print all lines in reverse order (recursively) from a text file
// - You can change the function header if you want
func reverseLines(_ contents: String) {
	// base case
	if contents.components(separatedBy: "\n").count == 1 {
		print(contents)
	}
	// recursive case
	else {
		let index = contents.firstIndex(of: "\n")!
		reverseLines(String(contents[contents.index(after: index)...]))
		print(String(contents[...contents.index(before: index)]))
	}
}
/// 5. evaluate
/// Write a recursive function evaluate that accepts a string representing a math expression and computes its value.
/// - The expression will be "fully parenthesized" and will consist of + and * on single-digit integers only.
/// - You can use a helper function. (Do not change the original function header)
/// - Use Recursion
/// evaluate("7")                 -> 7
/// evaluate("(2+2)")             -> 4
/// evaluate("(1+(2*4))")         -> 9
/// evaluate("((1+3)+((1+2)*5))") -> 19
func evaluate(_ expr: String) -> Int {
	// in case input is one digit
	if expr.count == 1 {
		return Int(expr)!
	}
	
	// drop both side of ( )
	var expr = expr
	print("\(expr) -- all")
	if !expr.isEmpty{

	}
	
	expr.removeFirst()
	expr.removeLast()
	
	if let (startIndex, endIndex) = evaluateHalperSplit(expr) {
		let childGroup = String(expr[startIndex...endIndex])
		var frontPart = expr.startIndex == startIndex ? "" : String(expr[...expr.index(before: startIndex)])
		var endPart = expr.endIndex == endIndex ? "" : String(expr[expr.index(after: endIndex)...])
		let frontOpe = frontPart.isEmpty ? ""  : String(frontPart.removeLast())
		let endOpe = endPart.isEmpty ? "" : String(endPart.removeFirst())
		print("\(frontPart) -- front")
		print("\(childGroup) -- next")
		print("\(endPart) -- end")
		return evaluateHelperCalc(String(evaluate(frontPart)) + frontOpe + String(evaluate(childGroup)) + endOpe + String(evaluate(endPart)))
	} else {
		return evaluateHelperCalc(expr)
	}
}

func evaluateHalperSplit(_ expr: String) -> (startIndex: String.Index, endIndex: String.Index)? {
	guard let groupEndIndex = expr.firstIndex(of: ")") else { return nil }
	let frontExpr = expr[...expr.index(before: groupEndIndex)]
	let groupStartIndex = frontExpr.lastIndex(of: "(")!
	return (groupStartIndex, groupEndIndex)
}

func evaluateHelperCalc(_ expr: String) -> Int {
	if let addSignIndex =  expr.firstIndex(of: "+") {
		let firstNum = Int(expr[...expr.index(before: addSignIndex)])
		let secoundNum = Int(expr[expr.index(after: addSignIndex)...])
		return firstNum! + secoundNum!
	}
	if let multSignIndex = expr.firstIndex(of: "*") {
		let firstNum = Int(expr[...expr.index(before: multSignIndex)])
		let secoundNum = Int(expr[expr.index(after: multSignIndex)...])
		return firstNum! * secoundNum!
	}
	return 0
}
