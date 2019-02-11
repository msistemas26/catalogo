//
//  ProductDetailsModels.swift
//  Catalogo
//
//  Created by Raul Mantilla on 11/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

enum ProductDetails
{
    // MARK: Use cases
    enum FetchProducts
    {
        struct Request
        {
        }
        struct Response
        {
            var fetchedProduct: Product
        }
        struct ViewModel
        {
            struct DisplayedProduct
            {
                let name: String?
                let image: String?
                let finalPrice: Int?
                let currency: String?
                let color: String?
                let description: String?
                let composition: String?
                let sizes: [Size]
            }
            var displayedProduct: DisplayedProduct
        }
    }
}
