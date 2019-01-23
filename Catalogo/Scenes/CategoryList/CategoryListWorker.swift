//
//  CategoryListWorker.swift
//  Catalogo
//
//  Created by Raul Mantilla on 23/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

class CategoryListWorker
{
    let theCatalogApi = TheCatalogApi()
    
    func fetchCategories(storeId: Int?, completionHandler completion: @escaping ([Category]) -> Void)
    {
        if let storeId = storeId {
            theCatalogApi.fetchCategories(storeId: storeId){ (categories) in
                completion(categories)
            }
        }
    }
}
