//
//  Guesser.swift
//  Guesser
//
//  Created by Jupally,Hari Priya on 2/26/19.
//  Copyright © 2019 Jupally,Hari Priya. All rights reserved.
//

import Foundation
class Guesser{

    private var correctAnswer:Int
    private var _numAttempts:Int
    private var guesses: [Guess]
    
    
struct Guess {
    var correctAnswer:Int
    var numAttemptsRequired:Int
    
 }
    
    var numAttempts:Int {
        return _numAttempts
    }
    
    private init() {
        self.correctAnswer = 0
        self._numAttempts = 0
        self.guesses = []
    }

    static var shared = Guesser()
    
//    init(correctAnswer: Int, _numAttempts: Int, guesses: [Guess]) {
//        self.correctAnswer = correctAnswer
//        self._numAttempts = _numAttempts
//        self.guesses = guesses
//    }

    func createNewProblem() {
        correctAnswer = Int.random(in: 1...10)
        _numAttempts = 0
    }
    
    func amIRight(guess: Int) -> Result {
        _numAttempts = _numAttempts + 1
        if guess < correctAnswer {
            return Result.tooLow
        }
        else if guess > correctAnswer {
            return Result.tooHigh
        }
        else {
            guesses.append(Guess(correctAnswer: correctAnswer, numAttemptsRequired: _numAttempts))
            return Result.correct
        }
    }
    
    func guess(index: Int) -> Guess {
        return guesses[index]
    }
    
    func numGuesses() -> Int {
        return guesses.count
    }
    
    func clearStatistics() {
        guesses = []
    }
    
    func minimumNumAttempts() -> Int {
        if guesses.isEmpty {
            return 0
        }
        else {
        var min = guesses[0].numAttemptsRequired
        for i in guesses {
            if min > i.numAttemptsRequired {
                min = i.numAttemptsRequired
            }
        }
        return min
        }
    }
    
    func maximumNumAttempts() -> Int {
        if guesses.isEmpty {
            return 0
        }
        else {
        var max = guesses[0].numAttemptsRequired
        for i in guesses {
            if max < i.numAttemptsRequired {
                max = i.numAttemptsRequired
            }
        }
        return max
        }
    }
    
}

enum Result:String {case tooLow = "Too Low", tooHigh = "Too High", correct = "Correct"}
