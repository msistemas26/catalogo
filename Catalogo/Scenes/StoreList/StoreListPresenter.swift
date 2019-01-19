//
//  StoreListPresenter.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol StoreListPresentationLogic
{
     func presentStores(response: StoreList.FetchStores.Response)
}

class StoreListPresenter: StoreListPresentationLogic
{
     weak var viewController: StoreListDisplayLogic?
  
     // MARK: Methods
  
     func presentStores(response: StoreList.FetchStores.Response)
     {
     	var fetchedStores: [StoreList.FetchStores.ViewModel.DisplayedStore] = []
        for fetchedStore in response.fetchedStores
        {
            let displayedStores = StoreList.FetchStores.ViewModel.DisplayedStore(name: fetchedStore.name, countryCode: fetchedStore.countryCode, websiteCode: fetchedStore.websiteCode)
            
            fetchedStores.append(displayedStores)
        }
        let viewModel = StoreList.FetchStores.ViewModel(displayedStores: fetchedStores)
        viewController?.displayStores(viewModel: viewModel)
     }
}
