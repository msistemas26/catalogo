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
    let theCatalogApi = TheCatalogApi()
    
    func fetchProducts(storeId: Int?, categoryId: String?,  completionHandler completion: @escaping ([Product]) -> Void)
    {
        if let storeId = storeId {
            theCatalogApi.fetchProducts(storeId: storeId, categoryId: categoryId){ (stores) in
                completion(stores)
            }
        }
    }
}
