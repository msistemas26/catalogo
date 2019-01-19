//
//  Product.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright © 2019 Raul Mantilla Assia. All rights reserved.
//

import Foundation

struct Product: Codable
{
    let description: String?
    /*let modelId: String?
    let name: String?
    let type: String?
    let sku: String?
    let url: String?
    let color: String?
    let composition: String?
    let care: String?
    let originalPrice: Int?
    let finalPrice: Int?
    let finalPriceType: String?
    let currency: String?
    let images: [String]?
    let sizes: [Size]
 */
}

struct ProductsList: Codable {
    let results: [Product]
}

struct Size: Codable {
    let variantId: String?
    let name: String?
    let stockQty: Int?
    
}
