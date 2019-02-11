//
//  HomeListRouter.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol HomeListRoutingLogic
{
    func routeToCategories()
    func routeToDetails()
}

protocol HomeListDataPassing
{
    var dataStore: HomeListDataStore? { get set }
}

class HomeListRouter: NSObject, HomeListRoutingLogic, HomeListDataPassing
{
    weak var viewController: HomeListViewController?
    var dataStore: HomeListDataStore?
    
    // MARK: Routing
    
    func routeToCategories()
    {
        //USING PROGRAMATICALLY PRESENTATION
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "CategoryListViewController") as! CategoryListViewController
        
        destinationVC.selectedCategory { (categoryId) in
            destinationVC.dismiss(animated: true, completion: nil)
            self.dataStore?.categoryId = categoryId
            self.viewController?.fetchProducts()
        }
        
        var destinationDS = destinationVC.router!.dataStore!
        self.passDataToCategory(source: self.dataStore!, destination: &destinationDS)
        self.navigateToCategory(source: self.viewController!, destination: destinationVC)
        
    }
    
    // MARK: Navigation
    
    func navigateToCategory(source: HomeListViewController, destination: CategoryListViewController)
    {
        destination.transitioningDelegate = destination
        source.modalPresentationStyle = .custom
        source.present(destination, animated: true)
    }
    
    // MARK: Passing data
    
    func passDataToCategory(source: HomeListDataStore, destination: inout CategoryListDataStore)
    {
        destination.storeId = source.storeId
    }
    
    func routeToDetails()
    {
        //USING PROGRAMATICALLY PRESENTATION
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
        var destinationDS = destinationVC.router!.dataStore!
        self.passDataToDetails(source: self.dataStore!, destination: &destinationDS)
        self.navigateToDetails(source: self.viewController!, destination: destinationVC)
        
    }
    
    // MARK: Navigation
    
    func navigateToDetails(source: HomeListViewController, destination: ProductDetailsViewController)
    {
        if let navigationController = source.navigationController {
            navigationController.pushViewController(destination, animated: true)
        }
    }
    
    // MARK: Passing data
    
    func passDataToDetails(source: HomeListDataStore, destination: inout ProductDetailsDataStore)
    {
        destination.selectedProduct = source.selectedProduct
    }
}
