//
//  APIRouter.swift
//  Google Books
//
//  Created by Sachithra Udayanga on 2021-02-11.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    // MARK: - Endpoints
    case searchBooks(query: String)
    case getBookVolumes
    
    // MARK: - Properties
    private var method: HTTPMethod {
        switch self {
        case .searchBooks:
            return .get
        case .getBookVolumes:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .searchBooks:
            return "volumes"
        case .getBookVolumes:
            return "volumes"
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        case .searchBooks(let query):
            return ["q": query]
        default:
            return nil
        }
    }
    
    private var body: Parameters? {
        switch self {
        default:
            return nil
        }
    }
    
    // MARK: - URLRequest
    func asURLRequest() throws -> URLRequest {
        let url = try NetworkingConstants.baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        if let body = body {
            do {
                let data = try JSONSerialization.data(withJSONObject: body,
                                                      options: .prettyPrinted)
                urlRequest.httpBody = data
            } catch {
                debugPrint("APIRouter: Failed to parse request body")
            }
        }
        if let parameters = parameters {
            urlRequest = try URLEncoding.queryString.encode(urlRequest, with: parameters)
        }
        return urlRequest
    }
}
