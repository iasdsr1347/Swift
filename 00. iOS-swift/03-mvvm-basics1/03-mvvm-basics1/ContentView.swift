//
//  ContentView.swift
//  01-mvvm-basics1
//
//  Created by 송영민 on 12/16/25.
//

import SwiftUI
import Combine

class CounterViewMdoel: ObservableObject {
    @Published var count: Int = 0
    
    func increment() {
        count += 1
    }
    
    func reset() {
        count = 0
    }
}

struct ContentView: View {
    @StateObject private var viewModel = CounterViewMdoel()
    
    var body: some View {
        VStack(spacing: 16) {
            Text("카운트: \(viewModel.count)")
            
            Button("증가") {
                viewModel.increment()
            }
            
            Button("초기화") {
                viewModel.reset()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
