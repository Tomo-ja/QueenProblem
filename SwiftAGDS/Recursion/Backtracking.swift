//
//  Backtracking.swift
//  SwiftAGDS
//
//  Created by Tomonao Hashiguchi on 2022-07-13.
//

import Foundation

func rollDiceSum (_ n: Int, _ sum: Int) {
	var choices = [Int]()
	rollDiceSumHelper(n, sum, 0, choices: &choices)
}

private func rollDiceSumHelper(_ n: Int, _ desiredSum: Int, _ soFar: Int, choices: inout [Int]){
	if n == 0 {
		if desiredSum == soFar{
			print(choices)
		}
	} else {
		for i in 1...6{
			if (soFar + i + (n - 1) * 1 <= desiredSum) && (soFar + i + (n - 1) * 6 >= desiredSum) {
				choices.append(i)
				rollDiceSumHelper(n - 1, desiredSum - i, soFar + i, choices: &choices)
				choices.removeLast()
			}
		}
	}
}
