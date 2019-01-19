//
//  HomeListWorker.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

class HomeListWorker
{
    func fetchProducts(completionHandler completion: @escaping ([Product]) -> Void)
    {
        var fetchedProducts:[Product] = []
        for index in 1...50 {
            fetchedProducts.append(Product(description: "Demo \(index)"))
        }
        completion(fetchedProducts)
    }
}
