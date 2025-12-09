//
//  main.swift
//  01-swift-basics3
//
//  Created by 송영민 on 12/9/25.
//
/*
Struct를 사용해야 할 때
✅ 데이터를 캡슐화하는 것이 주 목적
✅ 복사가 필요하고 독립적인 상태 유지
✅ 상속이 필요 없음
✅ 비교적 작은 데이터


Class를 사용해야 할 때
✅ 여러 곳에서 같은 인스턴스 공유 필요
✅ 상속이 필요
✅ 소멸자(deinit)가 필요
✅ 참조 카운팅이 필요
*/
import Foundation

// 값 타입 모델 - 보통 struct 사용
struct Book {
    var title: String
    var author: String
}

// 참조 타입 - 보통 ViewModel, Manager 등에 사용
class Counter {
    var value: Int = 0 // 프로퍼티
    
    func increment() { //메서드
        value += 1
    }
}

// enum - 정해진 상태/종류
enum Theme {
    case light
    case dark
    case sepia
}

//메모리 스택에 저장, 각자 다른 인스턴스
var book1 = Book(title: "제목", author: "작가")
var book2 = book1

book2.title = "SwiftUI"
print(book1.title) // Swift
print(book2.title) // SwiftUI


//힙에 저장, 복사 시 참조 타입등 ARC 메모리 관리 (상태 관리에서 사용)
// 상속이 필요한 경우 사용
let counter1 = Counter() // 인스턴스 생성 - init() 호출, 새 객체 생성
let counter2 = counter1

counter2.increment() // 메서드 실행 - 기존 인스턴스의 함수 호출
print(counter1.value)
print(counter2.value)



let theme: Theme = .dark


// 추가 예제
class GameCharacter {
    var name: String
    var health: Int
    var level: Int
    
    // 초기화자 - 캐릭터 생성
    init(name: String) {
        self.name = name
        self.health = 100
        self.level = 1
        print("\(name) 캐릭터 생성!")
    }
    
    // 메서드 - 게임 중 사용
    func attack() {
        print("\(name)의 공격!")
    }
    
    func takeDamage(_ damage: Int) {
        health -= damage
        print("\(name)의 체력: \(health)")
    }
    
    func levelUp() {
        level += 1
        health = 100
        print("\(name) 레벨업! Lv.\(level)")
    }
}

// 캐릭터 생성 (init 호출)
let hero = GameCharacter(name: "용사")

// 게임 플레이 (메서드 호출)
hero.attack()
hero.takeDamage(20)
hero.levelUp()
