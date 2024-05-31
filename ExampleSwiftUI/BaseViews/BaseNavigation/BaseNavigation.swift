//
//  BaseNavigation.swift
//  ExampleSwiftUI
//
//  Created by Nantarat Prommanon on 24/5/2567 BE.
//

import SwiftUI

struct BaseNavigation<Content>: View where Content: View {
    @ViewBuilder var content: () -> Content
    
    let coloredNavAppearance = UINavigationBarAppearance()
    
    var body: some View {
        if #available(iOS 16, *) {
            NavigationStack(root: content)
                .navigationBarBackButtonHidden(false)
                .tint(.white)
                .onAppear {
                    self.setNavigationStyle()
                }
        } else {
            NavigationView(content: content)
                .navigationBarBackButtonHidden(false)
                .tint(.white)
                .onAppear {
                    self.setNavigationStyle()
                }
        }
    }
    
    private func setNavigationStyle() {
        self.coloredNavAppearance.configureWithOpaqueBackground()
        self.coloredNavAppearance.backgroundColor = .systemBlue
        self.coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        let buttonAppearance = UIBarButtonItemAppearance(style: .plain)
        buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.coloredNavAppearance.backButtonAppearance = buttonAppearance
               
        UINavigationBar.appearance().standardAppearance = self.coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = self.coloredNavAppearance
    }
}
