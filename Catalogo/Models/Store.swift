//
//  Store.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright © 2019 Raul Mantilla Assia. All rights reserved.
//

import Foundation

struct Store: Codable
{
    let name: String?
    let countryCode: String?
    let websiteCode: String?
    let storeViews: [StoreView]
}

struct StoreView: Codable {
    let name: String?
    let storeId: String?
}
