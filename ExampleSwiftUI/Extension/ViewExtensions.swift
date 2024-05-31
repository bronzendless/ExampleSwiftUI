//
//  ViewExtensions.swift
//  ExampleSwiftUI
//
//  Created by Nantarat Prommanon on 31/5/2567 BE.
//

import SwiftUI

extension View {
    func observeListOffset(_ offset: @escaping (CGPoint) -> ()) -> some View {
        self.modifier(ObserveListOffset(onChange: offset))
    }
    
    func overlayBaseNavigationLink(destination: some View) -> some View {
        self.overlay {
            BaseNavigationLink {
                destination
            }
        }
    }
}
