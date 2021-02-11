//
//  Errors.swift
//  Google Books
//
//  Created by Sachithra Udayanga on 2021-02-11.
//

import Foundation

enum Errors: Error {
    case initialNetworkingError
    case defaultnetworkingError
    
    var errorTitle: String {
        switch self {
        case .initialNetworkingError, .defaultnetworkingError:
            return "Network error"
        }
    }
    
    var errorDescription: String {
        switch self {
        case .initialNetworkingError:
            return "Please connect to the internet to download initial data"
        case .defaultnetworkingError:
            return "Please connect to the internet"
        }
    }
}
