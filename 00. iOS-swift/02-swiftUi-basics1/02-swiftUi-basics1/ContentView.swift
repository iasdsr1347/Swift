//
//  ContentView.swift
//  01-swiftUi-basics1
//
//  Created by 송영민 on 12/9/25.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0
    
    var body: some View {
        VStack(spacing: 16) {
            Text("카운트: \(count)")
            
            Button("증가") {
                count += 1
            }
            
            Button("초기화") {
                count = 0
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
