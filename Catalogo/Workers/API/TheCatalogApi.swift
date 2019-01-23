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

enum CatalogPath
{
    static let home_path = "http://private-anon-14d5203e40-gocco.apiary-mock.com"
    static let store = "/stores"
    static let products = "/stores/store_id/products/search?"
    static let categories = "/stores/store_id/categories"
}

final class TheCatalogApi
{
    
    init()
    {
        //TO DO
    }
    
    func fetchStores(completionHandler completion: @escaping ([Store]) -> Void)
    {
        let urlString = CatalogPath.home_path + CatalogPath.store
        
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
                            storeViews.append(StoreView(name: storeView["name"] as? String, storeId: storeView["storeId"] as? Int))
                        }
                        stores.append(Store(name: name, countryCode: countryCode, websiteCode: websiteCode, storeViews: storeViews))
                    }
                    completion(stores)
                case .failure(let error):
                    completion([])
                }
        }
    }
    
    func fetchProducts(storeId: Int, completionHandler completion: @escaping ([Product]) -> Void)
    {
        let productsPath = CatalogPath.products.replacingOccurrences(of: "store_id", with: String(storeId))
        let urlString = CatalogPath.home_path + productsPath
        Alamofire
            .request(urlString, method: .get)
            .responseJSON { response in
                guard let result = response.data else {
                    completion([])
                    return
                }
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                var products: ProductsResult
                products = try! decoder.decode(ProductsResult.self, from: result)
                completion(products.results)
        }
    }
    
    func fetchCategories(storeId: Int,completionHandler completion: @escaping ([Category]) -> Void)
    {
        let categoriesPath = CatalogPath.categories.replacingOccurrences(of: "store_id", with: String(storeId))
        let urlString = CatalogPath.home_path + categoriesPath
        print(urlString)
        Alamofire
            .request(urlString, method: .get)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    guard let jsonArray = value as? [[String: Any]] else {
                        return
                    }
                    var categories: [Category] = []
                    for categoryDict in jsonArray {
                        let categoryId = categoryDict["categoryId"] as? String
                        let name = categoryDict["name"] as? String
                        var children: [Category] = []
                        for child in categoryDict["children"] as! [[String: Any]] {
                            children.append(Category(categoryId: child["name"] as? String, name: child["name"] as? String,children: []))
                        }
                        categories.append(Category(categoryId: categoryId,name: name ,children: children))
                    }
                    completion(categories)
                case .failure(let error):
                    completion([])
                }
        }
    }
}
