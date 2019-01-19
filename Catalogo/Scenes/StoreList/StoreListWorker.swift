//
//  StoreListWorker.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

class StoreListWorker
{
    let theCatalogApi = TheCatalogApi()
    
    func fetchStores(completionHandler completion: @escaping ([Store]) -> Void)
    {
        theCatalogApi.fetchStores(){ (stores) in
            completion(stores)
        }
    }
}
