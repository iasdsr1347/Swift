//
//  main.swift
//  01-swift-basics4
//
//  Created by 송영민 on 12/9/25.
//

import Foundation

// Codable = Encodabel + Decodable
// Encodable: 구조체 -> JSON으로 변환
// Decodable: JSON -> 구조체로 변환

// Codable을 채택하면 자동으로 변환 코드 생성
struct ViewerSettings: Codable {
    var fontSize: Int // JSON의 "fontSize" 키와 매칭
    var theme: String // JSOn의 "theme" 키와 매칭
}

// 인스턴스 생성 ( 구조체 초기화 ) -> 이 인스턴스를 JSON으로 변환
let settings = ViewerSettings(fontSize: 18, theme: "dark")

//인코딩: struct -> Data(JSON)
let encoder = JSONEncoder() // JSONENcoder: Swift 객체를 JSON데이터로 변환하는 도구, 인코더 인스턴스 생성
encoder.outputFormatting = .prettyPrinted // 출력 포맷 설정, prettyPrinted의 효과는 사람이 읽기 쉽게 줄바꿈과 들여쓰기 추가
// try 키워드: encode는 에러를 던질 수 있음 (throws), try는 에러 처리가 필요함을 표시
let data = try encoder.encode(settings) // settings 구조체를 JSON으로 변환, 반환 타입: Data(바이너리 데이터)
// data는 Data 타입(binary data), JSON 문자열이 아니라 데이터 형태, 네트워크 전송, 파일 저장에 적합
print(String(data: data, encoding: .utf8)!) // Data를 String으로 변환하여 출력



//디코딩: Data -> struct
let decoder = JSONDecoder() // JSONDecoder: JSON 데이터를 Swift 객체로 변환하는 도구
let decoded = try decoder.decode(ViewerSettings.self, from: data) // .self: 타입 자체를 나타냄(메타타입)
print(decoded.fontSize, decoded.theme)




//MARK: try 에러 처리 방법
/* 1. try - 에러 발생 시 프로그램 중단 (현재 코드)
let data = try encoder.encode(settings)

// 2. try? - 에러 발생 시 nil 반환 (안전)
if let data = try? encoder.encode(settings) {
    print("변환 성공")
}

// 3. try! - 확신할 때만 사용 (위험)
let data = try! encoder.encode(settings)

// 4. do-catch - 에러 상세 처리
do {
    let data = try encoder.encode(settings)
    print("성공")
} catch {
    print("에러: \(error)")
}
*/

//MARK: Data 설명
/*
 // Data → String 변환 초기화 메서드
 -init?(data: Data, encoding: String.Encoding)
 data: 변환할 Data
 encoding: .utf8: UTF-8 인코딩 방식
 반환: String? (옵셔널)
 
 - .utf8 인코딩
 문자 인코딩 방식 (가장 널리 사용)
 JSON은 보통 UTF-8로 인코딩
 
 - ! 강제 언래핑
 print(String(data: data, encoding: .utf8)!)
 // ↑ 위험! 실전에서는 안전하게 처리 필요
 
 // 안전한 방법
 if let jsonString = String(data: data, encoding: .utf8) {
 print(jsonString)
 }
 */
