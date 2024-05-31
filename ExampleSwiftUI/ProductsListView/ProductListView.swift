//
//  ProductListView.swift
//  ExampleSwiftUI
//
//  Created by Nantarat Prommanon on 24/5/2567 BE.
//

import SwiftUI
import SwiftUIIntrospect

struct ProductListView: View {
    @StateObject private var viewModel = ProductViewModel()

    var body: some View {
        BaseNavigation {
            List {
                ForEach(Array(self.viewModel.products.enumerated()), id: \.offset) { index, product in
                    ProductView(
                        url: URL(string: product.thumbnail)!,
                        title: product.title,
                        description: product.description,
                        isHiddenLine: self.viewModel.products.count == index + 1
                    )
                    .overlayBaseNavigationLink(destination: ProductsDetailView(message: product.id))
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(.zero))
                    .listRowBackground(Color.white)
                    .padding(.zero)
                }
                if self.viewModel.canLoadMore {
                    HStack {
                        BaseActivityIndicator(isAnimating: .constant(true), style: .medium)
                            .onAppear {
                                debugPrint("onAppear")
                                self.viewModel.getProductsMore()
                            }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Product List")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                self.viewModel.getProducts()
            }
            .refreshable {
                self.viewModel.getProducts()
            }
            .observeListOffset({ offset in
                print(offset)
            })
        }
    }
}

#Preview {
    ProductListView()
}
