//
//  URLExtension.swift
//  SwiftTube
//
//  Created by Raul Pedraza on 28/09/2017.
//  Copyright © 2017 Raul Pedraza. All rights reserved.
//

import Foundation

extension URL {
    func queryStringComponents() -> [String: AnyObject] {
        
        var dict = [String: AnyObject]()
        self.query.map {
            for pair in $0.components(separatedBy: "&") {
                let components = pair.components(separatedBy: "=")
                if (components.count > 1) {
                    dict[components[0]] = components[1] as AnyObject?
                }
            }
        }
        
        return dict
    }
}
