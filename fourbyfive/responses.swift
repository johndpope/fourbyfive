//
//  responses.swift
//  fourbyfive
//
//  Created by Mikolaj Wielocha on 09/12/2018.
//  Copyright © 2018 Mikolaj Wielocha. All rights reserved.
//

import Foundation

struct User : Codable {
    let pk: Int64
    let profile_pic_id: String?
    let profile_pic_url: String?
}

struct LoginResponse : Codable  {
    let logged_in_user: User
}
