//
//  CategoryListPresenter.swift
//  Catalogo
//
//  Created by Raul Mantilla on 23/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol CategoryListPresentationLogic
{
     func presentCategories(response: CategoryList.FetchCategories.Response)
}

class CategoryListPresenter: CategoryListPresentationLogic
{
     weak var viewController: CategoryListDisplayLogic?
  
     // MARK: Methods
  
     func presentCategories(response: CategoryList.FetchCategories.Response)
     {
     	var fetchedCategories: [CategoryList.FetchCategories.ViewModel.DisplayedCategory] = []
        for fetchedCategory in response.fetchedCategories
        {
            
            var children: [CategoryList.FetchCategories.ViewModel.DisplayedCategory] = []
            
            for child in fetchedCategory.children {
                let childrenCategory = CategoryList.FetchCategories.ViewModel.DisplayedCategory(categoryId: child.categoryId, name: child.name, children: [])
                children.append(childrenCategory)
            }
            
            let displayedCategories = CategoryList.FetchCategories.ViewModel.DisplayedCategory(categoryId: fetchedCategory.categoryId, name: fetchedCategory.name, children: children)
            
            fetchedCategories.append(displayedCategories)
        }
        let viewModel = CategoryList.FetchCategories.ViewModel(displayedCategories: fetchedCategories)
        viewController?.displayCategories(viewModel: viewModel)
     }
}
