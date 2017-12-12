//
//  main.swift
//  MyGuessNum
//
//  Created by 鐘鼎皓 on 2017/10/29.
//  Copyright © 2017年 ChungTingHao. All rights reserved.
//

import Foundation

// 產生謎底
func creatAnswer(d:Int) -> String {
    var rs = Set<Int>()
    var rand: Int
    while rs.count < d {
        rand = Int(arc4random_uniform(10))
        rs.insert(rand)
    }

    var ret = ""
    for v in rs {
        ret += String(v)
    }
    return ret
}

// 比對
func checkAB(answer:String,guess:String) -> String {
    var A = 0, B = 0
    var ca:String, cg:String
    for i in 0..<answer.count {
        ca = substring(str: answer, start: i, len: 1)
        cg = substring(str: guess, start: i, len: 1)
        if ca == cg {
            A += 1
        }else if answer.contains(cg){
            B += 1
        }

    }
    return "\(A)A\(B)B"
}

func checkABv2(answer:String,guess:String) -> (A:Int,B:Int) {
    
    return (1,2)
}

func substring(str:String, start:Int, len:Int) -> String {
    let sindex = str.index(str.startIndex, offsetBy: start)
    let eindex = str.index(str.startIndex, offsetBy: start + len)
    let range = sindex..<eindex
    return String(str[range])
}

let args = CommandLine.arguments
for arg in args {
    print(arg)
}

let d:Int? = Int(args[1])

// main flow
let answer = creatAnswer(d:d!)
//print(answer)

var guess: String?
var isWin: Bool = false
for i in 1...10 {
    print("\(i). 請猜一個數字: ", terminator: "")
    guess = readLine()
    
    //  檢察機制
    //  1. [0-9]{d!}
    //  2. 任一數字不可重複
    
    if let gus = guess{
        let result = checkAB(answer: answer, guess: gus)
        print("\(guess!) => \(result)")

        if result == "\(d!)A0B" {
            isWin = true
            break
        }
    }
}

if isWin {
    print("WINNER")
}else {
    print("Loser:\(answer)")
}










