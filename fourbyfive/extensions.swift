//
//  extensions.swift
//  fourbyfive
//
//  Created by Mikolaj Wielocha on 06/12/2018.
//  Copyright © 2018 Mikolaj Wielocha. All rights reserved.
//

import Foundation
import Alamofire

func getCurrentMillis() -> Int64 {
    return Int64(Date().timeIntervalSince1970 * 1000)
}

extension URL {
    
    func getImageSize() -> Size? {
        if let provider = CGDataProvider(url: self as CFURL) {
            if let image = CGImage(jpegDataProviderSource: provider, decode: nil, shouldInterpolate: false, intent: CGColorRenderingIntent.defaultIntent) {
                    return Size(width: image.width, height: image.height)
            }
        }
        
        return nil
    }
}

extension String {
    
    func utf8() -> Data {
        return self.data(using: String.Encoding.utf8, allowLossyConversion: false)!
    }
}

extension String: ParameterEncoding {
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = data(using: .utf8, allowLossyConversion: false)
        return request
    }
    
}

extension UUID {
    
    func asString(keepDashes: Bool) -> String {
        let text = "\(self)"
        if (keepDashes) {
            return text
        } else {
            return text.replacingOccurrences(of: "-", with: "")
        }
    }
    
}
