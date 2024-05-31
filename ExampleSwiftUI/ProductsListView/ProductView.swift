//
//  ProductView.swift
//  ExampleSwiftUI
//
//  Created by Nantarat Prommanon on 24/5/2567 BE.
//

import SwiftUI
import Kingfisher

public struct ProductView: View {
    private var url: URL
    private var title: String
    private var description: String
    private var isHiddenLine: Bool
    
    public init(url: URL, title: String, description: String, isHiddenLine: Bool) {
        self.url = url
        self.title = title
        self.description = description
        self.isHiddenLine = isHiddenLine
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            HStack(alignment: .top) {
                VStack(spacing: 0.0) {
                    KFImage(self.url)
                        .placeholder {
                            Rectangle()
                                .fill(Color.gray)
                                .background(Color.blue)
                        }
                        .resizable()
                        .frame(width: 64.0, height: 64.0)
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 8.0) {
                    Text(self.title)
                        .lineLimit(2)
                        .font(.system(size: 24.0, weight: .bold))
                    Text(self.description)
                        .font(.system(size: 15.0, weight: .regular))
                }
            }
            if !self.isHiddenLine {
                Divider()
                    .padding(EdgeInsets(top: 8.0, leading: 8.0, bottom: 8.0, trailing: 8.0))
            }
        }
        .padding(EdgeInsets(top: .zero, leading: 8.0, bottom: .zero, trailing: 8.0))
    }
}
