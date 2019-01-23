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
    func showSelectedCategory(withCategoryIndex: Int)
}

protocol CategoryListDataPassing
{
    var dataStore: CategoryListDataStore? { get set }
}

class CategoryListRouter: NSObject, CategoryListRoutingLogic, CategoryListDataPassing
{
    weak var viewController: CategoryListViewController?
    var dataStore: CategoryListDataStore?
    
    // MARK: Routing
    
    func showSelectedCategory(withCategoryIndex: Int)
    {
        /*
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToConversation(source: dataStore!, destination: &destinationDS)
        navigateToConversation(source: viewController!, destination: destinationVC)
         */
    }
    
    /*
    // MARK: Navigation
    
    func navigateToConversation(source: CategoryListViewController, destination: ViewController)
    {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToConversation(source: CategoryListDataStore, destination: inout DataStore)
    {
        destination.value = ""
    }
    */
}
