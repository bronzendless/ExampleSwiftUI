//
//  ProductsDetailView.swift
//  ExampleSwiftUI
//
//  Created by Nantarat Prommanon on 31/5/2567 BE.
//

import SwiftUI

struct ProductsDetailView: View {
    @Environment(\.presentationMode) var presentation
//    @Environment(\.dismiss) var dismiss
    
    var message: Int
    var callback: (() -> Void)? = nil
    
    var body: some View {
        Text("\(message)")
            .toolbar {
            Button("Done") {
                self.presentation.wrappedValue.dismiss()
//                dismiss()
            }
        }
    }
}

#Preview {
    ProductsDetailView(message: 0, callback: nil)
}
