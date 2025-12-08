//
//  main.swift
//  01-swift-basics
//
//  Created by 송영민 on 12/9/25.
//

import Foundation

var name: String = "송영민"
let age: Int = 20 // let 변경 불가

func greet(who: String) -> String {
    return "안녕, \(who)"
}

let message = greet(who: name)
print(message)

// 배열
var numbers: [Int] = [1, 2, 3, 4, 5]
numbers.append(6)
print(numbers)

// 딕셔너리
var userInfo: [String: String] = [
    "name": "스위프트",
    "city": "실리콘밸리"
]
print(userInfo["name"] ?? "이름 없음")

if age >= 20 {
    print("성인")
} else {
    print("미성년")
}

