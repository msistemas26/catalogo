//
//  Category.swift
//  Catalogo
//
//  Created by Raul Mantilla on 19/01/19.
//  Copyright © 2019 Raul Mantilla Assia. All rights reserved.
//

import Foundation

struct Category: Codable
{
    let categoryId: String?
    let name: String?
    let children: [Category]
}
