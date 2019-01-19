//
//  StoreListModels.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

enum StoreList
{
    // MARK: Use cases
    enum FetchStores
    {
        struct Request
        {
        }
        struct Response
        {
            var fetchedStores: [Store]
        }
        struct ViewModel
        {
            struct DisplayedStore
            {
                let name: String?
                let countryCode: String?
                let websiteCode: String?
            }
            var displayedStores: [DisplayedStore]
        }
    }
}
