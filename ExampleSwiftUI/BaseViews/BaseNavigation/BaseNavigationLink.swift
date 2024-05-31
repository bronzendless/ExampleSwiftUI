//
//  BaseNavigationLink.swift
//  ExampleSwiftUI
//
//  Created by Nantarat Prommanon on 31/5/2567 BE.
//

import SwiftUI

struct BaseNavigationLink<Destination>: View where Destination : View {
    @ViewBuilder var destination: () -> Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            EmptyView()
        }
        .buttonStyle(EmptyButtonStyle())
        .opacity(.zero)
    }
}

struct EmptyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
    }
}
