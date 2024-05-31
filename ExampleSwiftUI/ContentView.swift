//
//  ContentView.swift
//  ExampleSwiftUI
//
//  Created by Nantarat Prommanon on 17/5/2567 BE.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        let gradient = LinearGradient(
            colors: [Color.orange,Color.green],
            startPoint: .top, endPoint: .bottom
        )
        BaseNavigation {
            ZStack {
                gradient
                .opacity(0.25)
                .ignoresSafeArea()
                VStack(spacing: 8.0) {
                    Divider()
//                        .background(.ultraThinMaterial)
                    Image(systemName: "globe")
                        .imageScale(.large)
//                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                    Text("Hello, world4")
                    Spacer()
                    Text("Hello, world!2")
                }
                .padding(12.0)
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
//            .toolbarBackground(Color.red, for: .navigationBar)
//            .toolbarBackground(.visible, for: .navigationBar)
        }
        
    }
}

#Preview {
    ContentView()
}
