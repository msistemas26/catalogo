//
//  StoreListInteractor.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol StoreListBusinessLogic
{
    func fetchStores(request: StoreList.FetchStores.Request)
}

protocol StoreListDataStore
{
    var fetchedStores: [Store] { get set }
    var selectedStore: Store? { get set }
}

class StoreListInteractor: StoreListBusinessLogic, StoreListDataStore
{
    var presenter: StoreListPresentationLogic?
    var worker: StoreListWorker?
    var fetchedStores: [Store] = []
    var selectedStore: Store?
    
    // MARK: Methods
    
    func fetchStores(request: StoreList.FetchStores.Request)
    {
         worker = StoreListWorker()
         worker?.fetchStores{ (fetchedStores) in
            self.fetchedStores = fetchedStores
            let response = StoreList.FetchStores.Response(fetchedStores: fetchedStores)
            self.presenter?.presentStores(response: response)
         }
    }
}
