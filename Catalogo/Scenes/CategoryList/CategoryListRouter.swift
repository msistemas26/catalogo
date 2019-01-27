//
//  CategoryListRouter.swift
//  Catalogo
//
//  Created by Raul Mantilla on 23/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol CategoryListRoutingLogic
{
    func showSelectedCategory(withCategoryId: String)
}

protocol CategoryListDataPassing
{
    var dataStore: CategoryListDataStore? { get set }
    var selectedCategory: String? { get set }
}

class CategoryListRouter: NSObject, CategoryListRoutingLogic, CategoryListDataPassing
{
    weak var viewController: CategoryListViewController?
    var dataStore: CategoryListDataStore?
    var selectedCategory: String?
    
    // MARK: Routing
    
    func showSelectedCategory(withCategoryId: String)
    {
        self.selectedCategory = withCategoryId
        if let parentController = viewController?.presentingViewController, let destinationVC = parentController as? HomeListViewController {
            var destinationDS = destinationVC.router!.dataStore!
            passDataToHome(source: dataStore!, destination: &destinationDS)
            navigateToHome(source: viewController!, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    
    func navigateToHome(source: CategoryListViewController, destination: HomeListViewController)
    {
        source.dismiss(animated: true, completion: nil)
    }
    
    // MARK: Passing data
    
    func passDataToHome(source: CategoryListDataStore, destination: inout HomeListDataStore)
    {
        destination.categoryId = self.selectedCategory
    }
}
