//
//  Connectivity.swift
//  Google Books
//
//  Created by Sachithra Udayanga on 2021-02-11.
//

import Foundation
import Alamofire

class Connectivity {
    static func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
