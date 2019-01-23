//
//  CategoryListInteractor.swift
//  Catalogo
//
//  Created by Raul Mantilla on 23/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol CategoryListBusinessLogic
{
    func fetchCategories(request: CategoryList.FetchCategories.Request)
}

protocol CategoryListDataStore
{
    var fetchedCategories: [Category] { get set }
    var selectedCategory: Category? { get set }
    var storeId: Int? { get set }
}

class CategoryListInteractor: CategoryListBusinessLogic, CategoryListDataStore
{
    var presenter: CategoryListPresentationLogic?
    var worker: CategoryListWorker?
    var fetchedCategories: [Category] = []
    var selectedCategory: Category?
    var storeId: Int?
    
    // MARK: Methods
    
    func fetchCategories(request: CategoryList.FetchCategories.Request)
    {
        worker = CategoryListWorker()
        worker?.fetchCategories(storeId: self.storeId){ (fetchedCategories) in
            self.fetchedCategories = fetchedCategories
            let response = CategoryList.FetchCategories.Response(fetchedCategories: fetchedCategories)
            self.presenter?.presentCategories(response: response)
        }
    }
}
