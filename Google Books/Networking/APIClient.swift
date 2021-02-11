//
//  APIClient.swift
//  Google Books
//
//  Created by Sachithra Udayanga on 2021-02-11.
//
import Alamofire
import RxSwift

class ApiClient {
    fileprivate static let disposeBag = DisposeBag()
    
    static func searchBooks(query: String) -> Observable<GoogleBookModel> {
        return request(APIRouter.searchBooks(query: query))
    }
    
    static func getBookVolumes() -> Observable<GoogleBookModel> {
        return request(APIRouter.getBookVolumes)
    }
    
    private static func request<T: Codable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = AF.request(urlConvertible).responseDecodable(of: T.self) { (dataResponse) in
                switch dataResponse.result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
