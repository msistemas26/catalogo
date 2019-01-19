//
//  TheCatalogApi.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright © 2019 Raul Mantilla Assia. All rights reserved.
//

import Foundation
import Alamofire

public enum Result<T> {
    case success(T)
    case failure(Error)
}

struct Contants
{
    static let home_path = "http://private-anon-14d5203e40-gocco.apiary-mock.com"
}

enum CatalogPath
{
    static let store = "/stores"
}

final class TheCatalogApi
{
    
    init()
    {
        //TO DO
    }
    
    func fetchStores(completionHandler completion: @escaping ([Store]) -> Void)
    {
        let urlString = Contants.home_path + CatalogPath.store
        print(urlString)
        Alamofire
            .request(urlString, method: .get)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    guard let jsonArray = value as? [[String: Any]] else {
                        return
                    }
                    var stores: [Store] = []
                    for store in jsonArray {
                        let name = store["name"] as? String
                        let countryCode = store["countryCode"] as? String
                        let websiteCode = store["websiteCode"] as? String
                        var storeViews: [StoreView] = []
                        for storeView in store["storeViews"] as! [[String: Any]] {
                            storeViews.append(StoreView(name: storeView["name"] as? String, storeId: storeView["storeId"] as? String))
                        }
                        stores.append(Store(name: name, countryCode: countryCode, websiteCode: websiteCode, storeViews: storeViews))
                    }
                    completion(stores)
                case .failure(let error):
                    completion([])
                }
        }
    }
    
}
