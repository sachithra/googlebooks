//
//  SearchBooksViewModel.swift
//  Google Books
//
//  Created by Sachithra Udayanga on 2021-02-11.
//

import Foundation
import RxSwift
import RxCocoa

class SearchBooksViewModel: BaseViewModel {
    lazy var booksRelay: PublishSubject<[BookItem]> = {
        return PublishSubject<[BookItem]>()
    }()
    var googleBooksResponse: GoogleBookModel?
    
    func searchBooks(query: String) {
        showPreloader()
        ApiClient.searchBooks(query: query)
                    .observe(on: MainScheduler.instance)
                    .subscribe(onNext: { googleBooksResponse in
                        self.googleBooksResponse = googleBooksResponse
                        let contents = Array(googleBooksResponse.items ?? [])
                        self.booksRelay.onNext(contents)
                        self.hidePreloader()
                    }, onError: { error in
                        if let error = error as? Errors {
                            self.errorVariable.onNext(error)
                        }
                        self.hidePreloader()
                    })
            .disposed(by: self.disposeBag)
    }
}
