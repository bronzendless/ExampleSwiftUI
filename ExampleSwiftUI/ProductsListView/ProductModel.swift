//
//  ProductModel.swift
//  ExampleSwiftUI
//
//  Created by Nantarat Prommanon on 24/5/2567 BE.
//

import Foundation

struct ProductstModel: Decodable {
    let products: [ProductModel]
}

struct ProductModel: Decodable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let dimensions: Dimensions
    let reviews: [Reviews]
    let warrantyInformation: String
    let shippingInformation: String
    let availabilityStatus: String
    let returnPolicy: String
    let minimumOrderQuantity: Int
    let meta: Meta
    let images: [String]
    let thumbnail: String
    
    struct Dimensions: Decodable, Hashable {
        let width: Double
        let height: Double
        let depth: Double
    }
    
    struct Reviews: Decodable, Hashable {
        let rating: Int
        let comment: String
        let date: String
        let reviewerName: String
        let reviewerEmail: String
    }
    
    struct Meta: Decodable, Hashable {
        let createdAt: String
        let updatedAt: String
        let barcode: String
        let qrCode: String
    }
}
