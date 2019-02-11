//
//  HomeListPresenter.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol HomeListPresentationLogic
{
     func presentProducts(response: HomeList.FetchProducts.Response)
}

class HomeListPresenter: HomeListPresentationLogic
{
     weak var viewController: HomeListDisplayLogic?
  
     // MARK: Methods
  
     func presentProducts(response: HomeList.FetchProducts.Response)
     {
     	var fetchedProducts: [HomeList.FetchProducts.ViewModel.DisplayedProduct] = []
        for fetchedProduct in response.fetchedProducts
        {
            let displayedProducts = HomeList.FetchProducts.ViewModel.DisplayedProduct(name: fetchedProduct.name, image: fetchedProduct.images?.first, finalPrice: fetchedProduct.finalPrice, currency: fetchedProduct.currency, color: fetchedProduct.color, description: fetchedProduct.description)
            
            fetchedProducts.append(displayedProducts)
        }
        let viewModel = HomeList.FetchProducts.ViewModel(displayedProducts: fetchedProducts)
        viewController?.displayProducts(viewModel: viewModel)
     }
}
