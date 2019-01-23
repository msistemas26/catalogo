//
//  CategoryListModels.swift
//  Catalogo
//
//  Created by Raul Mantilla on 23/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

enum CategoryList
{
    // MARK: Use cases
    enum FetchCategories
    {
        struct Request
        {
        }
        struct Response
        {
            var fetchedCategories: [Category]
        }
        struct ViewModel
        {
            struct DisplayedCategory
            {
                let categoryId: String?
                let name: String?
                let children: [DisplayedCategory]
            }
            var displayedCategories: [DisplayedCategory]
        }
    }
}
