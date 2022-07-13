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
	expr.removeFirst()
	expr.removeLast()
	
	// base case
	guard let (startIndex, endIndex) = evaluateHelperSplit(expr) else {
		return evaluateHelperCalc(expr)
	}
	
	// recursive case
	// split into 3parts, only middle part always has something
	var frontPart = expr.startIndex == startIndex ? "" : expr.getFrontString(by: startIndex).asString()
	let middlePart = expr[startIndex...endIndex].asString()
	var endPart = expr.endIndex == endIndex ? "" : expr.getEndString(from: endIndex).asString()
	
	// split number part and sign, middle part going to recursion so don't need this step
	let frontSign = frontPart.isEmpty ? ""  : frontPart.removeLast().asString()
	let endSign = endPart.isEmpty ? "" : endPart.removeFirst().asString()
	
	return evaluateHelperCalc("\(frontPart.isEmpty ? "" : String(evaluate(frontPart)))\(frontSign)\(String(evaluate(middlePart)))\(endSign)\(endPart.isEmpty ? "" : String(evaluate(endPart)))")
}

// return split points to divide string into 2 groups based on priorty of math
func evaluateHelperSplit(_ expr: String) -> (startIndex: String.Index, endIndex: String.Index)? {
	guard let _ = expr.firstIndex(of: ")") else { return nil }
	// E.g. expected format of expr is "((1+4)*4)+(1+2)"
	var count = 0
	for (index, letter) in expr.enumerated() {
		if letter == "(" {
			count += 1
		} else if letter == ")" {
			count -= 1
			if count == 0 {
				let groupEndIndex = expr.index(expr.startIndex, offsetBy: index)
				let frontExpr = expr[...groupEndIndex]
				let groupStartIndex = frontExpr.firstIndex(of: "(")!
				return (groupStartIndex, groupEndIndex)
			}
		}
	}
	return nil // never run here
}

func evaluateHelperCalc(_ expr: String) -> Int {
	// E.g. expected format of expr is "4+5"
	if let addSignIndex =  expr.firstIndex(of: "+") {
		let firstNum = Int(expr.getFrontString(by: addSignIndex))
		let secoundNum = Int(expr.getEndString(from: addSignIndex))
		return firstNum! + secoundNum!
	}
	if let multSignIndex = expr.firstIndex(of: "*") {
		let firstNum = Int(expr.getFrontString(by: multSignIndex))
		let secoundNum = Int(expr.getEndString(from: multSignIndex))
		return firstNum! * secoundNum!
	}
	return 0 // never run here
}

extension String {
	func getFrontString(by index: String.Index) -> String.SubSequence {
		return self[...self.index(before: index)]
	}
	func getEndString(from index: String.Index) -> String.SubSequence {
		return self[self.index(after: index)...]
	}
}

extension Character {
	func asString() -> String {
		return String(self)
	}
}

extension Substring {
	func asString() -> String {
		return String(self)
	}
}
