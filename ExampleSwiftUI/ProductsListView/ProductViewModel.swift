//
//  ProductViewModel.swift
//  ExampleSwiftUI
//
//  Created by Nantarat Prommanon on 24/5/2567 BE.
//

import Foundation
import Alamofire

protocol ProductViewModelInterface: ObservableObject {
    var products: [ProductModel] { get set }
    var max: Int { get }
    var countPerPage: Int { get }
}

class ProductViewModel: ProductViewModelInterface {
    @Published var products: [ProductModel] = []
    let max: Int = 10
    var countPerPage: Int = 0
    var canLoadMore: Bool = false
    
    public func getProducts()  {
        Task {
            self.countPerPage = 0
            let response: ProductstModel = try await NetworkManager.shared.request(
                url: "https://dummyjson.com/products",
                method: .get,
                parameters: [
                    "skip": self.countPerPage,
                    "limit": self.max
                ]
            )
            DispatchQueue.main.async {
                self.countPerPage += response.products.count
                self.products = response.products
                self.canLoadMore = response.products.count == self.max
            }
        }
    }
    
    public func getProductsMore()  {
        Task {
            let response: ProductstModel = try await NetworkManager.shared.request(
                url: "https://dummyjson.com/products",
                method: .get,
                parameters: [
                    "skip": self.countPerPage,
                    "limit": self.max
                ]
            )
            DispatchQueue.main.async {
                self.countPerPage += response.products.count
                self.products.append(contentsOf: response.products)
                self.canLoadMore = response.products.count == self.max
            }
        }
    }
}
