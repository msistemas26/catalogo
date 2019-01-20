//
//  HomeListModels.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

enum HomeList
{
    // MARK: Use cases
    enum FetchProducts
    {
        struct Request
        {
        }
        struct Response
        {
            var fetchedProducts: [Product]
        }
        struct ViewModel
        {
            struct DisplayedProduct
            {
                var name: String?
                let image: String?
                let finalPrice: Int?
            }
            var displayedProducts: [DisplayedProduct]
        }
    }
}
