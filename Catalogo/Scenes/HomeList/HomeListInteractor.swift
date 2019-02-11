//
//  HomeListInteractor.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol HomeListBusinessLogic
{
    func fetchProducts(request: HomeList.FetchProducts.Request)
    func selectProductWith(index: Int)
}

protocol HomeListDataStore
{
    var fetchedProducts: [Product] { get set }
    var selectedProduct: Product? { get set }
    var storeId: Int? { get set }
    var categoryId: String? { get set }
}

class HomeListInteractor: HomeListBusinessLogic, HomeListDataStore
{
    var presenter: HomeListPresentationLogic?
    var worker: HomeListWorker?
    var fetchedProducts: [Product] = []
    var selectedProduct: Product?
    var storeId: Int?
    var categoryId: String?
    
    // MARK: Methods
    
    func fetchProducts(request: HomeList.FetchProducts.Request)
    {
        worker = HomeListWorker()
        worker?.fetchProducts(storeId: self.storeId, categoryId: self.categoryId){ (fetchedProducts) in
            self.fetchedProducts = fetchedProducts
            let response = HomeList.FetchProducts.Response(fetchedProducts: fetchedProducts)
            self.presenter?.presentProducts(response: response)
         }
    }
    
    func selectProductWith(index: Int) {
        self.selectedProduct = fetchedProducts[index]
    }
}
