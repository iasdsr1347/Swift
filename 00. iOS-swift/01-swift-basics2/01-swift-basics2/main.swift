//
//  main.swift
//  01-swift-basics2
//
//  Created by 송영민 on 12/9/25.
//

import Foundation

var nickname: String? = nil

// if let 옵셔널 바인딩
// nickname이 nil이 아니면 값을 추출해서 nick 상수에 저장
if let nick = nickname {
    print("별명: \(nick)")
} else {
    print("별명 없음")
} // if문 안에서만 nick 사용 가능 , nil이면 else 블록 실행


// guard let 조기 종료 패턴
// nil이면 else구문 실행
// 이 시점: text는 String? (옵셔널)
func printUppercased(_ text: String?) {
    // 오른쪽 text: 함수 파라미터 (String? 타입, 옵셔널)
    // 왼쪽 text: 새로 만드는 상수 (String 타입, 언래핑됨)
    guard let text = text else {
        print("값이 없음")
        return //반드시 return/throw/break/continue 등으로 스코프 탈출
    }
    // 이 시점: text는 String (일반 타입)
    // 위의 옵셔널 text를 가리던 이름이 새로운 String text로 덮어씌워짐
    print(text.uppercased())
}

printUppercased("hello")
printUppercased(nil)



// 1. 라벨 생략 (_)
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}
add(1, 2)  // ✅

// 2. 라벨 사용
func add(a: Int, b: Int) -> Int {
    return a + b
}
add(a: 1, b: 2)  // ✅

// 3. 외부/내부 라벨 다르게
func add(first a: Int, second b: Int) -> Int {
    return a + b
}
add(first: 1, second: 2)  // 호출 시: first, second 사용
// 함수 내부에서는: a, b 사용

/*
// 함수이름 자체가 의마가 부족하면, 파라미터 레이블 사용하기
func move(from: String, to: String)  // 레이블이 있어야 명확함
move(from: "서울", to: "부산")
*/


// if let: 값이 있을 때의 로직이 중첩됨
func example1(_ text: String?) {
    if let text = text {
        // 여기서만 text 사용 가능
        print(text.uppercased())
        print(text.lowercased())
        // 더 많은 코드...
        // 들여쓰기가 계속 유지됨
    } else {
        print("값이 없음")
    }
    // 여기서는 text 사용 불가
}

// guard let: 조건 실패 시 빠르게 종료, 이후 코드가 깔끔함
func example2(_ text: String?) {
    guard let text = text else {
        print("값이 없음")
        return
    }
    
    // 여기부터 끝까지 text 사용 가능
    print(text.uppercased())
    print(text.lowercased())
    // 더 많은 코드...
    // 들여쓰기 없이 쭉 이어짐
}
