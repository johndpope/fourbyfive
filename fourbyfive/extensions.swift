//
//  extensions.swift
//  fourbyfive
//
//  Created by Mikolaj Wielocha on 06/12/2018.
//  Copyright © 2018 Mikolaj Wielocha. All rights reserved.
//

import Foundation
import Alamofire

extension String: ParameterEncoding {
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = data(using: .utf8, allowLossyConversion: false)
        return request
    }
    
}
